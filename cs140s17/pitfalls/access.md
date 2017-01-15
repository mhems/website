# `public` vs. `private`
## Stop! - Can't touch this

Java attempts to achieve data hiding via access modifiers. That is, it
lets the programmar specify the access level of a name. The old view
of object-oriented programming was concerned with hiding the data
internal to an object and only exposing that which users of the class
would need. This design choice gives programmers somewhat of a
contract, its not infallable, that what they specify as hidden will be
hidden to users of their code. By hidden, we mean that client code
cannot access it. Hence access modifiers, they modify the access of a
name.

Java has 4 access modifiers, `public`, `private`, `protected`, and the
implicit *package-private*. Classes, methods, and some variables may
be prefixed with an access modifier.

## What does each access modifier mean?

Before we look at which things allow access modifiers, we need to know
what each of the four modifiers mean. In order of accesibility, from
least to most:

### private

`private` is the most restrictive, only within that class can you
access that name, regardless of subclassing. Consider the access of
`i`, declared in class `A`.

```java
package A;

public class A {
    private int i;

    void timesTwo() {
        return i * 2; // OK
    }
}
```

```java
package A; // same package

public class B extends A { // B is a subclass of A

    public void foo() {
        A a = new A();
        System.out.println(a.i); // <- can't see i, won't compile
    }
}
```

### package-private

*package-private* is more open than `private`. It is the default
 access modifier, meaning that to declare a name to be
 *package-private*, simply omit an access modifier. A
 *package-private* name can be thought of as `public` to everyone
 within the same package, `private` to anyone outside the
 package. Consider the access of class `A`.

```java
package A;

class A {

}
```

```java
package A; // same package

class B {
    private A a; // OK
}
```

```java
package C; // different package

class C {
    private A a; // <- can't see A, won't compile
}
```

### protected

`protected` is slightly more open than *package-private*. A
`protected` name is accessible to those in the same package or any
subclasses (even if that subclass is in a different package). Consider
the access of `i`, defined in class `A`.

```java
package A;

public class A {
    protected int i;
}
```

```java
package A; // same package

public class Another {
    public void foo() {
        A a = new A();
        System.out.println(a.i); // OK
    }
}
```

```java
package B; // different package

class B extends A { // B is a subclass of A

    void foo() {
        A a = new A();
        System.out.println(a.i); // OK
    }
}
```

### public

`public` means anyone can access that symbol, regardless of their
relationship with or the package of the declaring class. Consider the
access of class `A`.

```java
package A;

public class A {

}
```

```java
package B;

public class B {
    private A a; // OK
}
```

`B` can declare an instance variable of type `A` since the class `A`
is publicly visible. The access modifier of class `B` or variable `a`
has no implications on whether `B` can "see" `A`.

---

## What names can take access modifiers?

A class can take either the `public` or package-private access
modifier to dictate if that class is visible to other classes. Each
java file can contain only one public top-level class, it can contain
any number of package-private top-level classes as well as nested
classes. For example:

```java
package example;

// Any other class can use Class, it's public
public class Class {

    class InnerClass {

    }
}

// only classes within the example package can use me
class HelperClass {

}
```

All methods can take an access modifier to dictate if that method can
be called from within other classes.

```java
public class Class {
    // everyone can see the constructor
    public Class() { }

    // this function is only visible within this class
    private int helper_function() { return 0; }
}
```

A variable may take an access modifier depending on where it is
declared. If a variable is declared at class scope, it can take an
access modifier. If a variable is declared within a function, it
cannot take an access modifier since its visibility is already limited
to within that function.

```java
public class Class {
    public final double PI = 3.14; // anyone can access this
    private int myID; // only within this class is myID accessible

    public void foo() {
        int counter;
        public double num; // <- this won't compile
    }
}
```
