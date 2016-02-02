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
implicit `package-private`. Classes, methods, and some variables may
be prefixed with an access modifier.

## What does each access modifier mean?

Before we look at which things allow access modifiers, we need to know
what each of the four modifiers mean.

### public

### private

### protected

### package-private

---

## What names can take access modifiers?

A class can take either the `public` or package-private access
modifier to dictate if that class is visible to other classes. Each
java file can contain only one public top-level class, it can contain
any number of package-private top-level classes as well as nested
classes. For example:

```java
package example;

// Any other class can use Class, its public
public class Class {
    // ...
    class InnerClass {
        // ...
    }
}

// only classes within the example package can use me
class HelperClass {
    // ...
}
```

All methods can take an access modifier to dictate if that method can
be called from within other classes.

```java
public class Class {
    // everyone can see the constructor
    public Class() {}

    // this function is only visible within this class
    private int helper_function() {}
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
        // public double num; // <- this won't compile
    }
}
```
---

## A word on usage
