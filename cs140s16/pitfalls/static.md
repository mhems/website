# The `static` keyword
## Bro, do you even `new`?

In object-oriented programming (programming with classes), we
sometimes don't really need a class to perform our computation. Since
Java mandates that every file have a class, we can't have methods
outside of classes. Java recognizes that we may be forced to put
methods that don't really belong in a class within a class so Java
provides the `static` keyword. This keyword denotes that a variable or
method does not need to be accessed from an instance of that class, it
can be accessed just by the name of the class. This means that with
`static`, you don't have to create `new` instance. Informally, the use
of `static` conveys that the variable or method can stand on its own,
but since it must be put in a class, here we are.

You've seen `static` before in `public static void main(String[]
args)`. The entry point to our program should not require us to make a
new instance just to call it since it is the boot method. `static` is
often used with variables that hold constants - values that don't
change. The Math class is full of `static` names. It defines the
constants E (euler's number) and PI as `static double`. The Math class
doesn't really hold any instance variables, its more of a class in the
sense that it holds a bunch of mathematical functions. So its
functions like `pow`, which raise a number to an exponent are declared
`static double pow(double num, double power)` All the context that
`pow` needs is supplied by the arguments, it needs nothing else so we
use `static` so other programmers don't need to create a new Math
object.

It is valid to call a `static` method with an
instance. Remember what `static` means - that you don't *have* to have
an instance to access the name. To use an instance is fine, you're
just supplying more information than the `static` function needs.


```java
public class User {
    private Person self;
    private int user_id;

    public User(Person p, int id) { self = p; user_id = id; }
    /* Setters and getters ... */

    public static void main(String[] args) {
        Person p1 = ...;
        Person p2 = ...;
        Person p3 = ...;
        User u1 = new User(p1, IDManager.newUniqueID()); // u1 has id 1000
        User u2 = new User(p2, IDManager.newUniqueID()); // u2 has id 1001
        IDManager mgr = new IDManager();
        User u3 = new User(p2, mgr.newUniqueID()); // u2 has id 1002
        // ...
    }
}

class IDManager {
    private static int current_id = 1000;

    public IDManager() {
        // do nothing
    }

    public static int newUniqueID() {
        int ret = current_id;
        current_id++;
        return ret;
    }
}
```

One pitfall with using `static` is when methods try to call each
other. By using `static`, you're saying you don't need an instance of
the class, so Java presumes you don't (as it should). Consequently, we
cannot call a non-static (instance) method from a `static` method
since we have no instance in the first place. The one exception to
this is the constructor, since that creates an instance. We also
cannot modify an instance variable since, again, we have no instance.

```java
public class Foo {
    private static int X;
    private double num;

    public Foo(double n) { num = n; }

    public void getX() {
        return X; // works since you can see static from instance
    }

    public static void main (String[] args) {
        Foo f = new Foo(100); // fine, calling constructor
        System.out.println(f.getX()); // fine, calling with an instance
        System.out.println(getX()); // compile error, cannot call getX, an instance method, without an instance
    }
}
```

What the programmer likely intends is for `getX()` to be `static`
since it uses nothing belonging to the instance. That way both print
statements will work. You could also make `X` public, then either
`Foo.X` or `new Foo().X` will work.
