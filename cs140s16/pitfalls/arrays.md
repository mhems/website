# Working with arrays
## Bundle common items under one group

When modeling problems, we often see common items grouped together. A
lot of cars, shelf of books, stack of plates, etc. To program
solutions to problems of this nature, languages supply data structures
to structure our data. The simplest of these is the array - a fixed
length, linear container where items of the same type are stored
consecutively in memory. Arrays can hold any type, but all elements in
the array must be the same type. They are also a fixed length, once
you declare an array of a certain length, that length is final. You
can change the elements within the array, just not its length. In
Java, an array of ints would look like this

```java
int [] myInts = { 5, 6, 7, 8, 9, 10};
```

`myInts` holds 6 integer elements in the specified order. If you know
you want an array, but don't yet know what elements you want, you can
construct an empty array of a specified length.

```java
int [] myInts = new int[6];
```

Arrays are zero-indexed, meaning the first element starts at index 0
and the last element is at index length-1. Elements are accessed with
the `[]` operator.

```java
System.out.println(myInts[3]); // prints 8
myInts[2] = 11; // updates third slot to now hold 11 (overwrites 7)
```

If you try to access an element outside the array, you get an out of
bounds error and your program quits.

```java
System.out.println(myInts[-1]); // ERROR
myInts[6] = 20; // ERROR
```

Note that an array of length N has no element at index N because
elements start at index 0.

Now that we have arrays, we'd like to use them as a group. The for
loop is the natural choice.

```java
double[] numbers = { 0.0, 1.1, 2.2, 3.3, 4.4 };

for (int index = 0; index < numbers.length; ++index) {
    System.out.println(numbers[index] + " is at index " + index + " in numbers array");
}

for (Double d : numbers) {
    System.out.println(d);
}
```


Arrays can hold objects.

```java
public class Animal {
    private String name;
    private int age;

    public Animal(String name, int age) { this.name = name; this.age = age; }
    public String getName() { return name; }
    public int getAge() { return age; }

    public static void main(String[] args) {
        Animal[] farm = { new Animal("Wilbur", 5),
                          new Animal("Charlotte", 30),
                          new Animal("Templeton", 20) };
        System.out.println("The farm has " + farm.length + " animals");
        System.out.println("Here are their names:")
        for (Animal a : farm) {
            System.out.println(a.getName());
        }
        System.out.println("Here are their ages:");
        for (int i=0; i < farm.length; ++i) {
            System.out.println(farm[i].getAge());
        }
    }
}
```

Be careful with using the enhanced for-loop to populate an empty array.

```java
int[] array = new int[10];

for (Integer i : array) {
    i = 5;
}
for (Integer i : array) {
    System.out.println(i);
}
```

gives the following output

```
0
0
0
0
0
0
0
0
0
0
```

Why didn't our updates take effect? The reason is that the dummy
variable the enhanced for-loop uses (`i` in the above example) is
merely a copy of that element. Changing it just changes the dummy
variable, which is **not** the same as the element itself. Thus, we
must use the normal for-loop.
