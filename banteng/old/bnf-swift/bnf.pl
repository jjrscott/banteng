#!/usr/bin/perl

use Data::Dumper;
use File::Slurp;

my $content = read_file($ARGV[0]);

my @tokens = grep {!/^ *$/} split /('[^']+')|%[^\n]*|([;\|:])|[\t\n ]+/, $content;

my %definitions;

my $current_definition;

for (my $token_index=0;$token_index<@tokens;$token_index++)
{
	if ($tokens[$token_index+1] eq ':')
	{
		$current_definition = $tokens[$token_index];
		$definitions{$current_definition} = [];
	}
	elsif ($tokens[$token_index] eq ':' || $tokens[$token_index] eq '|')
	{
		push @{$definitions{$current_definition}}, [];
	}
	elsif ($tokens[$token_index] ne ';')
	{
		push @{$definitions{$current_definition}[-1]}, $tokens[$token_index];
	}

}

my $swift = "";

my $prefix = "CLang";

foreach my $definition (sort keys %definitions)
{
	$swift .= sprintf qq(\n);


	$swift .= sprintf qq(class %s : Unit {\n), normalise_definition($definition);
	
	$swift .= sprintf qq(\toverride class func parse(string : String, inout parentIndex : String.Index) -> Unit? {\n);

	my $count = 0;
	foreach my $part (@{$definitions{$definition}})
	{
		$swift .= sprintf qq(\t\tif let unit = %s%d.parse(string, parentIndex : &parentIndex) { return unit }\n), normalise_definition($definition), $count;
		$count += 1;
	}
	$swift .= sprintf qq(\t\treturn nil\n);
	$swift .= sprintf qq(\t}\n);
	
	$swift .= sprintf qq(}\n);
	
	$count = 0;
	foreach my $part (@{$definitions{$definition}})
	{
		$swift .= sprintf qq(\n);

		$swift .= sprintf qq(class %s%d : %s {\n), normalise_definition($definition), $count,normalise_definition($definition);

		$swift .= sprintf qq(\toverride class func parse(string : String, inout parentIndex : String.Index) -> Unit? {\n);
		$swift .= sprintf qq(\t\tvar index : String.Index = parentIndex\n);
		
		my $match_count = 0;
		my $parse_count = 0;
		foreach my $bit (@{$part})
		{
			if (my ($terminal) = $bit =~ /^'([^']+)'$/)
			{
				$match_count += 1;
			}
			else
			{
				$parse_count += 1;
			}
		}

		if ($parse_count)
		{
			$swift .= sprintf qq(\t\tvar units : [Unit] = []\n);
		}

		foreach my $bit (@{$part})
		{
			if (my ($terminal) = $bit =~ /^'([^']+)'$/)
			{
				$swift .= sprintf qq(\t\tguard match(string, parentIndex : &index, constant : "%s") else { return nil}\n), $terminal;
			}
			else
			{
				$swift .= sprintf qq(\t\tif let unit = %s.parse(string, parentIndex : &index) { units.append(unit) } else { return nil }\n), normalise_definition($bit);
			}
		}
		$swift .= sprintf qq(\t\tparentIndex = index\n);
		if ($parse_count)
		{
			$swift .= sprintf qq(\t\treturn %s%d(units : units)\n), normalise_definition($definition), $count;
		}
		elsif ($match_count)
		{
			$swift .= sprintf qq(\t\treturn %s%d()\n), normalise_definition($definition), $count;
		}
		
		$swift .= sprintf qq(\t}\n);
		$count += 1;
		$swift .= sprintf qq(}\n);
	}
}

print $swift;

sub normalise_definition
{
	return $prefix.join "", map {ucfirst} split "_", $_[0];
}