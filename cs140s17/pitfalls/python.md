# Difference between Python and Java

Perhaps the greatest difference between Python and Java is that Python
is interpreted and dynamically typed while Java is compiled and thus
statically typed. Consequently Java requires things to be declared up
front and agreeing, whereas Python is more flexible and trusting. This
is a trade-off many programmers argue over.

What do these fancy words mean to you? In Python, we make a change to
our code, run it, and see the effects. Not so in Java, it is a two
step process. We must first compile, we check to see that our syntax
(spelling) is correct and all of our types are in agreement. If, and
only if, compilation succeeds, we can run our program. When we make a
change, we must re-compile and re-run to see the effects. Read
[here](compiling.html) for more.

One thing that people coming to Java from Python have trouble with is
the fact that everything in Java must be declared before use and that
declaration must name the type of the variable. Instead of just `a = 5`
in Python, Java mandates we write `int a = 5;`. The same holds for
functions, Java needs `boolean isOdd(int n)` while Python looks like `isOdd(n)`.

Another thing Java introduced is the notion of
[access](access.html). Classes, functions, and variables all have
enforced access levels that dictate who can see what. In Python, the
language of consulting adults, the programmer is trusted to access
responsibly.

---

## Syntax Differences

Concept | Python | Java
--- | --- | ---
Comments | # | // or /* ... */ (multiline)
statement terminator | newline ('\n') | ;
block level | indentation level | { }
string terminator | single or double quotes | double quotes
std output | `print` | `System.out.println`
nothing value | `None` | `null`
instance specifier | `self` | `this`
compound if-else | `elif` | `else if`
exception handling | `try`/`except` | `try`/`catch`
exception throwing | `raise` | `throw`
no return type | `None` | `void`
logical operators | `and`, `or`, `not` | &&, \|\|, !
boolean literals | `True` and `False` | `true` and `false`
parent referent | `super()` | `super`
module system | implicit by filename | `package`
constructor | `def __init__(self, ...)` | `A(...)`
construction | a = A(...) | A a = new A(...)
subclassing | `class Child(Parent)` | `class Child extends Parent`
non-instance access | omit `self` | use name of class
basic container | `list` ([]) | `array` ([]) or `ArrayList`
associative container | `dict` ({}) | `HashMap`
string method | `def __str__(self)` | `String toString()`
