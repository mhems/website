# Compiling
## Excuse me stewarddess, I speak 0x6a 0x69 0x76 0x65

Writing computer code would be useless if the computer were not able
to understand what the programmer was trying to express and compute
accordingly. There are two main ways a piece of code, written in a
programming language, gets translated to machine code that the
computer can understand and execute.

The first method is interpretation. Scripting languages like Python
are 'interpreted', meaning an interpreter is used. At a high level, an
interpreter takes as input the source program and the program's
input(s) and outputs the program's output. The interpreter goes
line-by-line through the program with the program's
input. Interpretation trades generality for specificity. Each time you
want to run a program with an input, the program is translated
again. This gives interpreted languages a more dynamic awareness at
the cost of upfront safety.

sayhello.py:
```python
import sys
print(sys.argv[1]) # argv[0] is the invoking program ('python')
```

```bash
> python sayhello.py 'hello world'
hello world
```

The second method is compilation. Languages like C, C++, and Java are
all compiled languages, meaning a compiler translates the source
code. A compiler takes a source program as input and outputs an
executable program. That program can then be run with input as
desired. This is why each time you change the source code, you must
re-compile to produce a new executable. The compiler examines the
entire program as it produces the executable, giving compilers a
deeper (more forward) understanding of the program. This trades
on-the-fly decisions for generality and safety enforcement. Each time
you want to run a program with an input, you run the executable with
that input.

SayHello.java:
```java
package example;
public class SayHello {
    public static void main(String[] args) {
        System.out.println(args[0]);
    }
}
```

```bash
> javac -d . SayHello.java
> java -cp . example.SayHello 'hello world'
hello world
```

Let's take a deeper look at what we just did.

`SayHello.java` holds a class `SayHello`. In Java, the file name and
class name must match exactly, consequently there is only one main
class per file.

We give the source program to the compiler, `javac`.  You'll notice
the first line of the program specified the class is in the `example`
package. All of our programs will be part of a package. This keeps
common code under the same roof. Note that a package lies at the
`java` level, it is not necessary for `SayHello.java` to be in a
folder (directory) named `example`, though this is sometimes a
convention. The `-d .` is an option given to `javac`. It says the
**d**irectory to put/find the package is `.`. `.` is a shorthand the
shell gives us to refer to the current directory we are in. The last
argument to `javac` is the name of the source file(s) to compile.

`javac` then outputs the compiled files. This is always the name of
the file (class) with the extension *.class*. You'll notice that our
directory now contains a new directory, `example`. This **is** the
name of the package and holds the compiled files. When we invoke
`java`, we tell it where to find the compiled files (the
**c**lass**p**ath) with `-cp .`. We must also tell `java` the entry
point of our code, i.e. where to start execution. This is the
package-qualified name of the class that holds the `main` method you
want to run, in our case `example.SayHello`. The last argument is our
input to the `SayHello` program.

---

### A word about executables

With Java, the notion of executables is a bit different than with that
of C and C++. One of the reasons Java took off back in the day was
that it targeted a virtual machine, the **J**ava **V**irtual
**M**achine. The JVM gives way to Java's slogan "*write once, run
anywhere*". With C and C++, the compiler translates your code to the
specific architecture of your machine. The executable it produces is
only guaranteed for that architecture. To go to a different machine,
you'd need to re-compile on that machine. With Java, it targets the
JVM so anyone that wants to run your Java program just needs a
JVM. This is the common 'architecture'. Thus, you can distribute the
compiled java files and clients can run that without portability
issues.
