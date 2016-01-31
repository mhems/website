# Control constructs
## Taming your code

A large aspect of a computer language is what control constructs it
offers. In other ways, what ways does a programmer have available to
specify conditional execution.

The basic control constructs offered by Java include `if`, `else`,
`for`, `while`, `do/while`, and `switch`. Within the looping
constructs `while`, `do/while`, and `for`, `continue` and `break` are
also available. We will step through how to each of these.

## Branching constructs

### if/else

The simplest control construct is that of the `if`/`else`. This offers
the skeleton: if some condition is true, execute some portion of
code. Optionally, if this condition was false, execute a different
portion of code.

```java
if (num % 2 == 0) {
    System.out.println("The number " + num + " is even!");
} else {
    System.out.println("The number " + num + " is odd!");
}
```

```java
if (num > 100) {
    num = 100;
}
```

Sometimes, new programmers want to only execute a portion of code if
the condition is false, i.e. they only really need the `else`
block. This leads to bad code like

```java
if (num % 2 == 0) {
    // Do nothing, I don't need to do anything if num is even
} else {
    num += 1;
}
```

If you find yourself in this situation, simply negate the condition,
put the code you put in the `else` in the `if` and leave off the
`else` block. The `!` is the negation operator.

```java
if (!(num % 2 == 0)) { // could also be `if (num % 2 != 0)`
    num += 1;
}
```

Another common tendency is to over-use `if`/`else` in a `boolean`
context. For example, if you were writing a function to determine if a
number is odd, you may write:

```java
boolean numIsOdd(int num) {
    if (num % 2 != 0) {
        return true;
    } else {
        return false;
    }
}
```

Two things are worth noting. For one, once you return from a function,
there's no going back, so you could omit the `else` and have the
equivalent code.

```java
boolean numIsOdd(int num) {
    if (num % 2 != 0) {
        return true;
    }
    return false;
}
```

The other point is that the return type of `numIsOdd` is boolean, the
same type that `if` and `else` take in the first place. So we can
shorten our code to simply

```java
boolean numIsOdd(int num) {
    return num % 2 != 0;
}
```

`if`s and `else`s can be stacked together to improve the following

```java
int n = /* ... */ ;
if (n > 0) {
    // n is positive
} else { // n is either 0 or negative
    if (n == 0) {
        // n is 0
    } else {
        // n is anything else (negative)
    }
}
```

to

```java
int n = /* ... */ ;
if (n > 0) {
    // n is positive
} else if (n == 0) {
    // n is 0
} else {
    // n is anything else (negative)
}
```

in order to reduce the nesting of statements (how far right the
statement extends)

### switch

If you find yourself writing a long series of `if`, `else if` chains,
the `switch` statement may be used.

```java
/* Assume:
 * 0 means hearts
 * 1 means diamonds
 * 2 means spades
 * 3 means clubs
 */
void printSuit(int card_suit) {
    switch(card_suit) {
        case 0:
            System.out.println("HEARTS");
        break;
        case 1:
            System.out.println("DIAMONDS");
        break;
        case 2:
            System.out.println("SPADES");
        break;
        case 3:
            System.out.println("CLUBS");
        break;
        default:
            System.out.println("I dont recognize the suit " + card_suit);
        break;
    }
}
```

The `default` statement is like the final `else`, it gets executed if
no other case matched. The `break` is necessary so that if case 0 gets
executed, case 1 does not also get executed. Sometimes, programmers
intend for the cases to *fallthrough*.

```java
void printColor(int card_suit) {
    switch (card_suit) {
        case 0:
        /* FALLTHROUGH */
        case 1:
            System.out.println("RED");
        break;
        case 2:
        /* FALLTHROUGH */
        case 3:
            System.out.println("BLACK");
        break;
        default:
            System.out.println("I dont recognize the suit " + card_suit);
        break;
    }
}
```

## Looping constructs

The `for`, `while`, `do`/`while` are all close siblings that can be
made to achieve a common looping pattern. However, one may be more
natural than the others in some situations.

### for

A common looping construct is the `for` loop. While it can be bent to
implement more complex loops, the `for` loop is best used to loop an
amount that is known up front.

```java
int factorial(int N) {
    prod = 1;
    for (int i = 2; i <= N; i++) {
        prod *= i;
    }
    return prod;
}
```

The for loop says for an integer variable named `i`, initialized to
`2`, increment `i` by `1` up to and including `N`.

### while

The while loop is best used for looping by an amount that may not be
known when starting the loop or its dependent on the data being looped
through. For instance, in a search for an element in an array.

```java
int indexOf(int[] array, int num) {
    int index = 0;
    while (index < array.length && array[index] != num) {
        ++index;
    }
    if (array[index] != num) {
        // num not found, return -1
        return -1;
    }
    return index;
}
```

### do/while

The `do`/`while` loop is quite similar to the `while` loop. Its
intention is for looping situations that will always loop at least
once. With the plain `while` loop, you'll notice we check the
condition before we enter the body. If the condition is false off the
bat, the body is never entered. This is sometimes desired, sometimes
not. If you find yourself writing code like

```java
int n;
n = foo();
while (n > 0) {
    n = foo();
}
```

Consider changing your code to
```java
int n;
do {
    n = foo();
} while(n > 0);
```

### continue

While looping, we may want to only execute some of the body of the
loop depending on the state of the loop. In these cases, the
`continue` can be used to skip to the next iteration of the loop.

```java
// Print the odd numbers from 1 to 10
for (int i=1; i<=11; i++) {
    if (i % 2 == 0) { // even
        continue; // skip to next number
    }
    System.out.println(i);
}
```

### break

Another keyword you can use to manipulate looping from within the loop
body is `break`. This allows you to early quit the loop.

```java
int indexOf(int[] array, int num) {
    boolean found = false;
    int index = 0;
    while (index < array.length) {
        if (array[index] == num) {
            found = true;
            break; // no sense in going further, we already found num
        }
        ++index;
    }
    if (!found)
        return -1;
    }
    return index;
}
```
