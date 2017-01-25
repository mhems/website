# Exceptions
## How to be truly exceptional

Most modern languages provide some mechanism for handling exceptional
cases that may arise during a program's execution. These are aptly
called exceptions. There are two sides to exceptions - dealing with
them once they've occured and raising them to signify an exceptional
case. Java uses the word `throw` to signify raising an exception and
`catch` to signify handling an exception. Baseball analogies could ensue.

Java classifies exceptions into two categories, checked and unchecked.

## Handling exceptions

### Checked exceptions

Along the lines of Java's up-front nature, some potentially
exceptional operations are what Java calls **checked**. This means
that the programmer is forced to write code to handle them if they
occur. It is a compile error to not handle a checked exception. One
example is the `FileNotFoundException` that could potentially be
thrown when trying to create a file. The exception is checked so we
must handle that code with a `try`/`catch` block.

```java
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;
// ...
// declare variable outside try/catch so we can use it after
Scanner scanner = null;
try { // put potentially exceptional stuff here
    scanner = new Scanner(new File("some_file.txt"));
} catch(FileNotFoundException e) {
    // if the Scanner constructor throws a FileNotFoundException,
    // this code exectues:
    System.out.println("File " + "some_file.txt" + "not found");
    e.printStackTrace(); // show calls that led to this exception
    Sytem.exit(-1); // irrecoverable error, exit entire program with error code
}
// we can now use scanner to scan from file
// scanner can't be null since we exit if there's an exception
while (scanner.hasNext()) {
    System.out.println(scanner.next());
}
```

The above snippet reads a file and prints its contents back out,
exiting if the file cannot be found.

Once you handle an exception with a `catch`, execution proceeds to
after that block. You've handled that exception so Java moves on.

Had we left out the `try`/`catch` block, javac would have given the
error: *unreported exception `FileNotFoundException`; must be caught
or declared to be thrown.* You'll notice that javac said the exception
could be caught (i.e. with a `try`/`catch` block) **or** declared to
be thrown - more on this later.

### Unchecked exceptions

On the other hand, handling every possible exception that could ever
occur is tedious and unnecessary. Hence, Java has unchecked
exceptions, which you are not **forced** to handle. You may if you
wish but you don't have to. The most abundant example of this is the
`ArrayOutOfBoundsException` and `NullPointerException`. Any time you
use access a member of an object, that object could be `null`. It
would be ridiculous of Java to expect the programmer to wrap every use
of `.` with a `try`/`catch`. So what happens if an unchecked exception
happens? Java prints out the stack trace (chain of calls that led to
exception) and exits the program.

Consider the above snippet again, this time with the line

```java
scanner = new Scanner(new File("some_file.txt"));
```

replaced with

```java
scanner = new Scanner(new File(null));
```

The documentation of the `File` constructor states that it throws a
`NullPointerException` iff it is passed `null`. Since our catch block
only catches `FileNotFoundException`s, Java prints the stack trace and
exits. We could append another `catch` block after the first one, but
what would we really be doing that Java wouldn't do by default.

```java
// same as above
try {
    scanner = new Scanner(new File(null));
} catch(FileNotFoundException e) {
    // same as above
} catch(NullPointerException e) {
    System.out.println("OH NO!"); // all that's different from no catch at all
    e.printStackTrace(); // done by default
    System.exit(1); // done by default (default exit code is 1)
}
```

However, with unchecked exceptions, if they occur and we don't handle
them, we lose control. Java prints the stack trace and exits, there's
no returning.

---

## Creating exceptions

Now that we've seen the one side of something else throwing an error
and us dealing with it, let's take the mitt off and talk about how to
`throw` an exception. When writing library code that someone else will
use, we want to handle any possible internal exceptions that could
occur, or at least let them know when we can't handle it.

Let's say, for illustrative purposes, that we are writing a class
representing a special kind of file reader that skips the blank lines
in a file.

```java
import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class MyFileScanner extends Scanner {

    private FileInputStream input;

    public MyFileScanner(File source) {
        input = new FileInputStream(source);
    }

    // ...
}
```

The Java documentation tells us that the `FileInputStream` constructor
we're internally calling within our constructor `throws` a
`FileNotFoundException` if the file cannot be found. Reasonable
enough.  However, the above does not compile - remember,
`FileNotFoundException` is a checked exception. We must handle it, or
declare that we `throw` it. We could use a `try`/`catch` block, but
what would the `catch` contain? We can't really make assumptions on
how the user of our `MyFileScanner` wants to react to an absent file
so we instead `throw` the exception to the caller. We're essentially
playing hot-potato. `FileInputStream` throws an error, we don't want
to catch it, so we throw it on to our caller, passing the buck. We
tell Java we're deferring the exception handling to our caller by
changing the method signature.

```java
public MyFileScanner(File source) throws FileNotFoundException { ... }
```

Now anyone that uses our constructor must use a `try`/`catch` or they
too can pass the buck to their caller and on it can go. This is
because `FileNotFoundException` is checked; were it unchecked its up
to them. Eventually someone will have to handle it though, like say a
`main` method.

The above discusses how to propagate an exception but how do we
`throw` a new exception - with the `throw` keyword! This is often used
to raise exceptions we've written - more on that after this.

```java
boolean isPasswordValid(String s) {
    if (s == null) {
        throw new NoPasswordGivenException("You must give a password");
        // anything here won't be seen, no return after throwing
    }
    // s is non-null since an exception would be thrown if it were
    // ...
}
```

The `throw` keyword is followed by the object you'd like to throw. We
create an instance of the `NoPasswordGivenException` exception class
with a message and then it is thrown. Control goes back to the calling
function.

Sometimes people new to exceptions like to overuse
`throw`. If an exception would happen, there's no need to check for it
and `throw` it explicitly, that will happen implicitly. For example,
code like this is completely unnecesary.

```java
public int countNumNulls(Object[] array) {
    if (array == null) {
        throw new NullPointerException();
    }
    // ...
}
```

If `array` were `null`, Java would throw a `NullPointerException` the
first time you tried to use `array`, there's no need to do it yourself.

---

## Writing exceptions

When writing programs that have their own domain logic, we often have
exceptional cases we'd like to express. Take the above password
example. When no password is given (i.e. via `null`), we can't do
much. We could assume its not null and let Java throw a
`NullPointerException` but this would look foreign to an end-user. We
do not want to expose the inner workings of Java, we want the user to
get a descriptive error so we create a new exception class. If we want
the exception to be unchecked, we declare the new class to `extend`
`RuntimeException`, otherwise, `extend` Exception.

Unchecked:

```java
public class NoPasswordGivenException extends RuntimeException {
    // ...
}
```

Checked:

```java
Public class NoPasswordGivenException extends Exception {
    // ...
}
```

To meaningfully subclass `Exception`, we should implement a
constructor that takes the message to output.

```java
public class NoPasswordGivenException extends RuntimeException {
    public NoPasswordGivenException(String msg) {
        super(msg); // call RuntimeException's constructor with msg
        // ...
    }
}
```

Since this class's sole purpose is to wrap an already existing
exception (`NullPointerException`) for the sake of cleanliness, we
could have also implemented `isPasswordValid` like this

```java
boolean isPasswordValid(String s) {
    try {
        // method logic ...
    } catch (NullPointerException e) {
        throw new NoPasswordGivenException("You must give a password");
    }
}
```

Woah, exception inception. We've caught one exception only to throw
another? Yes, we are wrapping a low-level exception Java provides with
one we've made to make it clearer to the end-user.
