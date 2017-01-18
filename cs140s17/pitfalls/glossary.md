# Glossary of commonly used Terms

Below is a list of terms with casual definitions and the occasional code
example.

* **Argument** the value sent to a method/function when calling it. For example,
  in `foo(5)` and `foo(3+2*4)`, the arguments are `5` and `11` respectively
* **Array** a fixed-length number of slots that hold values of a specific type
  adjacent in memory. `int [] arr = new int[5]` creates an array of 5 ints.
* **Class** a blueprint for objects that describe the data it holds (variables)
  and actions that can be taken upon it (methods). A class is declared like so:

  ```java
  class Foo {
    // ...
  }
  ```
* **Compilation** the process of translating given human-readable source code
  (plaintext) files into machine-executable object files
* **Compile Error** a fatal issue with the provided source code that will not
  allow translation. For example, a simple typo like misspelling `class` or
  forgetting a curly brace (`{`) will result in a compile error
* **Compiler** the executable program that accepts source code and if valid,
  translates it to machine code
* **Constructor** the subroutine responsible for initializing the state of an
  object, often involving initializing instance variables from arguments sent
  in. For example,

  ```java
  class Foo {
    private int i; // instance variable
    public Foo(int i_in) {
      i = i_in; // use i_in to initialize to i
    }
  }
  ```
* **Declaration** the act of creating a variable by specifying its name and
  type. For example `int count;` declares a variable named count of type int.
* **Function** a block of code that accepts input parameters and may return
  output. For example, `Math.sqrt` is a function that takes in one double
  parameter and returns its square root, as a double: `public static double
  sqrt(double n)`.
* **Initialization** the act of assigning a declared variable some initial
  value. For example `count = 1;` initializes the pre-existing count variable
  to 1.
* **Instantiation** the act of creating a **new** specific object of a class,
  using the class as a blueprint. For example, `new Foo()` instantiates Foo to a
  new instance.
* **Interpretation** the process of interpreting given human-readable source
  code into runnable code and running that code with any given program input
* **Interpreter** the executable program that accepts source code and its input
  and if valid, interprets and executes that code with the given input
* **Method** a function that lives within a class that is called on instances of
that class. For example,

```java
Foo foo = new Foo(); // declare and initialize to new instantiation of Foo
foo.bar(); // call method bar on object foo
```
* **Package** Java's bundling system that puts common classes into one unit as a
  way of organizing programs spanning multiple files.
* **Parameter** an input variable to a function, only available within that
  function. For example, `public static double sqrt(double n)` has one
  parameter, a double named n.
* **Runtime Error** an issue that arises during execution of the program, for
  instance trying to divide by zero.
* **Type** a category describing the set of values an instance of that type may
  take on. For example, the int type describes the set of integers while the
  boolean type describes the set {true, false}. Classes create new types.
* **Variable** a name-value pair that associates a program identifier to a
  possibly changing value. For example, `int a = 5; a = 10;` declares and
  initializes a variable named a with value 5, then changes that value to 10.
