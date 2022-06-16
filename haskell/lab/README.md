# Laboratory work for MIREA master's degree subject Functional Programming

## Text of task

> Реализовать преобразование инфиксной нотации арифметических выражений со скобками в постфиксную. Придумать и реализовать стековый автомат для вычисления выражений в постфиксной нотации.
Если делать стековый автомат, то можно сделать свою реализацию Форта.

## How to use it

```(shell)
ghc main.hs
./main
> (1+10)*5+(10+4)/2
"1 10 + 5 * 10 4 + 2 / + "
62.0
```

## Tasks

- [x] Compute RPN(Reverse Polish notation) string
- [x] Translate infix notaion to RPN (used [Shunting_yard](https://en.wikipedia.org/wiki/Shunting_yard_algorithm) algorithm)
- [x] Add support for round bracket
--
- [ ] Add some special functions of (maybe?) [Forth](https://en.wikipedia.org/wiki/Forth_(programming_language))
