# Interview Questions 2

1. While Class and Struct both represent data structures that can contain data and functions, they are different by:  

    <dt>Structs</dt>
    <dd>- are mostly used on smaller sets of data.</dd>
    <dd>- they cannot be inherited from another structs.</dd>
    <dd>- are value type.</dd>
    <dt>Classes</dt>
    <dd>- are mostly used on larger sets of data.</dd>
    <dd>- classes can be inherited from another classes.</dd>
    <dd>- are reference type.</dd>

2. The finally keyword is used with a try/ catch block and at the time when programmer wants a guarantee code to be run after try/catch block.

3. Properties of an array:
   -  holds elements with the same data type.
   -  Array size should be declare with a number at the time of declaration.
   -  Can be Single or Mutliple dimensional.
   -  Index starts at 0.

4. An escape sequence refers to a combination of characters beginning with a back slash followed by letters or digits: 
   -   The one used the most: 
        -   `\n` Drop cursor to newline
        -   `\t` Horizontal Tab
        -   `\'` Single Quote
        -   `\"` Double Quote
   -   The one never used, but looks interesting: 
        -   `\r` Move cursor to the beginning of current line
        -   `\f` Form Feed.

5. Basic String Operations are:
   - Concatention: Using `+` or `Concat` with two or more string/ characters, it'll append to one another.
   - String Comparison: compare if two string are equal using `==` or `!=` operator.

6. The difference between continue and break statements is that break is to jump out of loop while continue is to skip one iteration in the loop. 

7. Explain get and set accessor properties:
   - `get` - will be executed whenever the property is read
   - `set` - will be executed whenever the property is assigned to a new value
   - `get and set` - do both

8. Objects are:
      - instance of a class
      - real, physical entity
      - created through `new` keyword many times

9. Classes are:
     - a group of similar object
     - logical entity
     - declared once
  
10. We cannot use "this" command within a static method because "this" refers to instance of the class, but there's no instance in static method.
    
11. Difference between "method overriding" and "method overloading":
    <dt>Method Overriding</dt>
    <dd> Allows a subclass/child class to provide special implementation of a method that is already provided by one of its super/parent classes </dd>
    <dt>Method Overloading</dt>
    <dd>The ability to redefine a function in more than one form.
    
    [More Info On Overloading](https://www.geeksforgeeks.org/c-sharp-method-overloading/)</dd>

12. The differences between static, public and void:
    - Static: Cannot use the `new` operator to create a variable of the class type. To access the members of a static class, we use the class name itself because there is no instance variable in static class.
    - Public: Access specifier that states that the method can be accesses publically.
    - Void: This states that the method doesn’t return any value.

13. The value types stores the value and that variable directly hold a value.

14. The reference types are used by reference that holds reference to the object instead of object itself.

15. Finally block will execute no matter if there is a return, break or continue statement.

16. The simpliest way to sort array in descending order, we can use `Array.Reverse(array)`.

17. Difference between the "as" and "is" operators:
    <dt>'is'</dt>
    <dd>- Used to check if the run-time type of an object is the same type with the given type.</dd>
    <dd>- Boolean type</dd>
    <dd>- Returns false if the given object is not the same type.</dd>
    <dd>- Used for only reference, boxing, and unboxing conversion.</dd>

    <dt>'as'</dt>
    <dd>- Used to perform conversion between compatible reference types or Nullable type.</dd>
    <dd>- Not boolean type.</dd>
    <dd>- Return null if the conversion is not possible.</dd>
    <dd>- Used only for nullable reference and boxing conversion.</dd>

    [Examples on IS and AS](https://www.geeksforgeeks.org/is-vs-as-operator-keyword-in-c-sharp/?ref=gcse)

18. Enum is a user defined data type. It is used to assign the data type that is easy to read and maintain.

19. Difference between an interface and an abstract class:
    <dt>Interface Class<dt>
    <dd>- Contain only a declaration part.</dd>
    <dd>- Does not contain static members.</dd>
    <dd>- Only contains public access modifier because everything in the interface is public.</dd>
    <dd>- A class can use multiple interface.</dd>
    <dt>Abstract Class<dt>
    <dd>- Contains both declaration and definition part.</dd>
    <dd>- Can contain static members.</dd>
    <dd>- Can contain different types of access modif. like public, private, and protect.</dd>
    <dd>- Can only use one abstract class.</dd>

    [More Comparison](https://www.geeksforgeeks.org/difference-between-abstract-class-and-interface-in-c-sharp/?ref=gcse)

20. Partial classes with the `partial` keyword indicates that other parts of the class can be defined in the namespace. And all the part must have the same accessibility like public, private...etc.

    [More on Partial class](https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/classes-and-structs/partial-classes-and-methods)
    
