# Grammar



Basically [Backus–Naur form](https://en.wikipedia.org/wiki/Backus–Naur_form) in encoded in JSON.



### Top level


```json
{
  "rules": {
    ...
  },
  "syntax": "<root rule>",
  "url": "..."
}
```

### String terminal

```json
"..."
```

### Binary terminal

```json
{
  "type" : "hex",
  "value" : "<Hex da1a>"
}
```

### Regex terminal

Removed as it ties the format to Python's regular expression grammar.

### Or / Any expression

```json
{
  "type" : "any",
  "expressions" : [subexpression1, subexpression2, ...]
}
```

### And expression

```json
[subexpression1, subexpression2, ...]
```

### Subexpression

```json
{
  "type" : "subexpression",
  "expression" : <subexpression>,
  "min" : <number>, // optional
  "max" : <number>, // optional
}
```
