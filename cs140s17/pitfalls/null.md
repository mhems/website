# Null Woes
## Don't worry, it's nothing

In everyday life, we often use nothing to characterize the absence of
everything. Its no different in programming. If we want to denote that
an object has no value, we need a nothing value we can assign to
it. In Java, this keyword is `null`. Any Object can be `null` as well
as arrays. Since any class you define is an Object, any variable of
class type can be `null`. Primitives, such as `int`, `double` and
`boolean`, cannot be `null`, their concept of nothing is 0, 0.0 and
false, respectively. If you leave an Object variable uninitialized,
Java will initialize it to `null`.

While its natural to describe a variable as holding nothing, (having
`null` value), the possibility of `null` mandates certain precautions
the programmer must take.

The most common threat `null` poses is when we want to do something
with a variable and that variable holds `null`. We are essentially
asking Java to do something with nothing, to which it throws its hands
up and quits. Having a variable hold `null` is harmless in itself, it
is not until we use the lookup (`.`) operator to access a member.

```java
int[] array = null; // fine
if (array.length > 10) // NO - runtime error
```

```java
class A {
    public void foo() { /* ... */ }
}

public class B  {
    private A a; // a is implicitly initialized to null since we didn't
    private B b = new B();

    public void bar() {
        b.bar(); // fine, b was constructed
        b = null; // fine, b is now null
        a.foo(); // NO - a is still null
        b.bar(); // NO - b is now null
    }
}
```

So what happens if we make the (common) mistake of trying to access a
member of a variable holding `null`? Java throws a
`NullPointerException` and the program exits if the exception is
unrecoverable. Read more on exceptions [here](exceptions.html).

So to avoid `NullPointerException`s we must take care to check our
variables before we try to access their members. If they're non-null,
go ahead, else, react accordingly, which is often to do nothing. This
comes particularly into play when dealing with arrays holding objects
since both the array itself and its elements could be `null`.

The below program appropriately checks for `null`s and gives the
following output:

```java
class Car {
    private int year;
    private String model;
    public Car(int year, String model) {
        this.year = year;
        this.model = model;
    }
    public int getYear() { return year; }
    public String getModel() { return model; }
}
```

```java
class Driver {
    /**
     * Prints model and year of each Car in lot
     */
    public static void printLot(Car[] lot) {
        if (lot != null) {
            System.out.println(lot.length + " cars in lot");
            for (Car c: lot) {
                if (c != null) {
                    System.out.println("Model: " + c.getModel() +
                                       ", Year: " + c.getYear());
                }
            }
        } else {
            System.out.println("Lot is null");
        }
        System.out.println("----------");
    }

    public static void main(String[] args) {
        Car[] l1 = null;
        printLot(l1);
        Car[] l2 = {new Car(2003, "Camry"), new Car(1998, "Civic")};
        printLot(l2);
        Car[] l3 = {};
        printLot(l3);
        Car[] l4 = {new Car(1995, "Impala"), null, new Car(2012, "Focus")};
        printLot(l4);
    }
}
```

```
Lot is null
----------
2 cars in lot
Model: Camry, Year: 2003
Model: Civic, Year: 1998
----------
0 cars in lot
----------
3 cars in lot
Model: Impala, Year: 1995
Model: Focus, Year: 2012
----------
```

Note that with `l4`, even though `l4[1]` is `null`, the length of `l4`
is still 3. This is because its holding 3 elements, one just happens
to be `null`. This is an important distinction from a `null` lot, as
with `l1`.
