# Hello World!


A typical introduction of a programming language to a new programmer
is the simple "Hello World" program. This minimal program simply
outputs "Hello World".

Let's break down Java's version of this program, in file *Hello.java*

```java
package example;

public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello World!");
    }
}

```


`package example`

This course uses the convention that all source files belong to a
package. So even for this simple program, we declare the `Hello` class
to be part of the `example` package.

`public class Hello`

Every Java file must contain exactly one top-level class with the same
name as its base name. Thus, class `Hello` is in file
*Hello.java*. The class is preceded by the `public` access modifier,
which declares the class to be accessible to all. While not necessary,
it is this class's convention for classes to be public. Look to
[modifiers](access.html) for a description on access modifiers.

`public static void main(String[] args)`

Memorize this in its exact form. Every Java program must have a class
with a main method where the program starts its execution. `public`
declares this method to be accessible to all, a necessity for an entry
point. `static` says this method can be called without an object
instance. We shouldn't need to create a `Hello` object to call the
entry point, then it's not the entry point. Look to
[static](static.html) for a description on the `static`
keyword. `void` declares this method's return type to be non-existent,
it does not return anything. Execution simply ends when the end of the
main method is reached (at least with the single-threaded applications
we'll be writing).  `main` is the name of the method, the entry point
must have a consistent name. `(String[] args)` is the list of
parameters this function accepts. This function accepts one parameter
named `arg` of type `String[]` (an array of `String`s). This is the
list of strings passed from the `java`'s invocation on the command
line.

`System.out.println("Hello World!");`

This line is what actually prints, the rest is just overhead. `System`
is a class that contains functions that interact with the system. It
has a `public static` variable, `out`, which represents standard
output to the terminal console. `out` has a function, `println`, which
takes the `String` you wish to print out. Strings in Java must be put
between double quotes ("). The *ln* at the end of `println` signifies
the function implicitly prints a newline. Use `print` when a newline
is not desired.

---

### To run

```bash
> javac -d . Hello.java
> java -cp . example.Hello
Hello World!
```

A description of what's going on here can be found in [compiling](compiling.html)
