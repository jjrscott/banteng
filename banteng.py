#! python3
# `$ python3 banteng.py --help` for more information

# MIT License
#
# Copyright (c) 2020 John Scott
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import argparse
import json


def main():
    parser = argparse.ArgumentParser(description='Generate a simple abstract syntax tree from the given files',
                                     epilog="""""",
                                     formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('input', nargs='*', help='Files to be parsed')
    parser.add_argument('--output', default='-', help='Location to save the AST')
    parser.add_argument('--grammar', help='A JSON file containing the grammar', required=True)
    args = parser.parse_args()

    with open(args.grammar, 'r') as f:
        grammar = json.load(f)
    with open(args.grammar, "w") as file:
        file.write(json.dumps(grammar, sort_keys=True, indent=2))
        file.write("\n")

    ast = {}

    for input_path in args.input:
        with open(input_path, 'r') as file:
            text = file.read()
            ast[input_path] = generate_ast(text, grammar)

    if len(ast) == 1:
        ast = list(ast.values())[0]

    outputContent = json.dumps(ast, sort_keys=True, indent=2)

    if args.output != '-':
        with open(args.output, "w") as file:
            file.write(outputContent)
            file.write("\n")
    else:
        print(outputContent)


def generate_ast(text, grammar):
    # rule = rules[rule_name]
    #
    # if isinstance(rule, list):

    foo = dict()
    foo['ast'], foo['unmatched'] = parse_rule(text, grammar, grammar['rules'][grammar['syntax']])

    return foo

def parse_rule(text, grammar, rule):
    if isinstance(rule, str):
        if text.startswith(rule):
            return rule, text[len(rule):]
        else:
            return None, text
    elif isinstance(rule, dict) and 'type' in rule:
        if rule['type'] == 'any':
            for subrule in rule['expressions']:
                subresult, subtext =  parse_rule(text, grammar, subrule)
                if subresult:
                    return subresult, subtext
            return None, text
        elif rule['type'] == 'symbol':
            return parse_rule(text, grammar, grammar['rules'][rule['symbol']])

    raise Exception(f'Unknown rule: {rule}')




if __name__ == "__main__":
    main()
