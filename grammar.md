# Grammar



Basically [Backus–Naur form](https://en.wikipedia.org/wiki/Backus–Naur_form) in encoded in JSON.



### Top level


```js
{
  "rules": {
    ...
  },
  "syntax": "<root rule>",
  "url": "..." // URL of format definition
}
```

### String terminal / Rule reference

If a string matches a rule name then it will be treated as a symbol, otherwise it will be treated as a raw string to match.

```js
"..."
```

### Regex terminal

Removed as it ties the format to Python's regular expression grammar.

### Or / Any expression

Will match any of the expressions given, in the order they are defined.

```js
{
  "type" : "any",
  "values" : [subexpression1, subexpression2, ...]
}
```

### And expression

Will match **every** expression given, in the order they are defined.

```js
{
  "type" : "all",
  "values" : [subexpression1, subexpression2, ...]
}
```

### Multiple matches



```js
{
  "values" : <subexpression>,
  "min" : <number>, // optional treated as zero
  "max" : <number>, // optional, treated as infinite
}
```
