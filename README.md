base57
======

A gem for converting numeric values between bases using the following character set:

    0123456789abcdefghijkmnopqrstvwxyzABCDEFGHJKLMNPQRSTVWXYZ

* Lower-case "L" (`l`), capital "I" (`I`), and the capital letter "O" (`O`) are excluded to prevent ambiguous values.
* Both capital and lower-case "U" (`u` and `U`) are excluded to prevent the most egregious accidental profanity :)

By default, it will convert from base 10 to base 57.

## Example

```
Base57.encode(123_456_789)
# => bFCnz

Base57.encode(123_456_789, to_base: 32)
# => 3moj8m

Base57.encode("3moj8m", from_base: 32, to_base: 57)
# => bFCnz
```

## TODO
* add tests
* better error detecting & handling
* better documentation
* rename gem?
