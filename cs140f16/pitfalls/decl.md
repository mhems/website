# Declarations vs. Initializations
## How to walk and chew gum at the same time

Java is statically typed, meaning all variables are declared up front
to be a certain type that cannot change during execution. This differs
from Python, a dynamically typed language, where a variable can take
on different types throughout a program's execution. While poor
practice, this is valid Python:

```python
a = 5
a = "hello world"
```

But in Java, this has no hope of compiling. Since a variable must
declare its type up-front, Java distinguishes between declaration and
initialization. In Python, initialization *is* declaration.

---

In Java, you would declare a variable named `myInt`, of `int`
(integer) type like so:

```java
int myInt;
```

The above declaration does just that, it declares your intention to
use a variable of type `int`. It does not necessarily initialize it to
a value so we must make sure all are variables are initialized. The
simplest way to ensure this is to initialize the variable at the point
of declaration.

```java
int myInt = 10;
```

or

```java
int myInt;
myInt = 10;
```

Once you declare a variable, you refer to it by name, you only mention
its type at declaration.

A common compilation error is given for something like the following:

```java
int i;
// ... A bunch of code ...
if (i > 10) {
    // handle case when i is large ...
}
```

```
error: variable i might not have been initialized
```

---

Earlier I mentioned that a declared variable might not necessarily be
initialized just because you declared it. There are two cases to
consider. When a variable is declared at class scope, it's ok to leave
a variable uninitialized, the compiler will implicitly initialize it
to its "zero-value". However, when a variable is declared within a
function, as is more common, it is not implicitly initialized. A
compile error will be given for an uninitialized variable, as we saw
above.

```java
public class AClass {
    public static int COUNT; // gets 0
    public char letter; // gets '\0'
    public double num; // gets 0.0
    public boolean status; // gets false
    public Object o; // gets null

    public void foo() {
        int i;
        if (i > 10) { // ERROR, i is at function level, never initialized
            // ...
        }
    }
}
```

---

Since every variable in Java is declared, it is not always necessary
to use the `this` keyword to refer to a class's member variable. On
the other hand, it does no damage to include the `this`, so when in
doubt, include it. `this` is necessary when you have a local variable
within a function that has the same name as a member variable - then
you need the `this` to disambiguate which variable you mean. Some
people write constructors like this:

```java
public class Person {
    private String name;
    private int age;

    public Person(String name, int age) {
        this.name = name;
        this.age = age;
    }
}
```

In the above code, since the constructor parameters are named the same
as the member variables, we must use `this` on the left hand side to
indicate we want the parameters to be assigned to the member
variables. Had we left off the `this`, the member variables would
never be given any value. If you name the function variables
differently, as some people choose to do, then you do not need the
`this` since it is clear what name refers to what variable.

```java
public class Person {
    private String name;
    private int age;

    public Person(String name_, int age_) {
        name = name_;
        age = age_;
    }
}
```
