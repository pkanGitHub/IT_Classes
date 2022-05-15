_Project Name: Dog_

_Target Platform: Console_

_Programming Language: C#_


Create a class called `Dog`.

`Dog` is to have the following `public` properties:

* `name` (of type string)
* `owner` (of type string)
* `age` (of type int)
* `gender` (of type Gender)
  
`Gender` is a enum type you need to create that contains `Male` and `Female`.

* Create a constructor (Links to an external site.) in the class to initialize all of the properties when creating an instance.
* Create a method (function in the class) called `Bark` that takes one parameter that is the number of times to bark and prints “Woof!” that many times to the Console.
* Create a method called `GetTag` that takes no parameters and returns a string. The method returns “If lost, call [owner]. [‘Her’|‘His’] name is [name] and [‘she’|‘he’] is [age]  [‘year’|‘years’] old.”
* [owner] means replace with the name of the owner.
* [‘Her’|‘His’] means choose to display “Her” or “His” based on the gender of the Dog.
* [name] means replace with the name of the Dog.
* [‘she’|‘he’] means choose to display “she” or “he” based on the gender of the Dog
* [‘year’|‘years’] means to choose to display “year” or “years” depending on the age of the Dog. If `age `is 1, use “year”. If any other `age`, use “years”.
* In the `Main` function of the application, test that instances of `Dog` can be created and that the methods work. In the following, “Orion” is the name of the `Dog` instance, “Shawn” is the `owner`, 1 is the age, and `Gender.Male` is the `gender`.

```C#
Dog puppy = Dog("Orion", "Shawn", 1, Gender.Male);  // create object instance
puppy.Bark(3); // output: Woof!Woof!Woof!
Console.WriteLine(puppy.GetTag()); // output: If lost, call Shawn. His name is Orion and he is 1 year old.

Dog myDog = Dog("Lileu", "Dale", 4, Gender.Female);  // create object instance
myDog.Bark(1); // output: Woof!
Console.WriteLine(myDog.GetTag()); // output: If lost, call Dale. Her name is Lileu and she is 4 years old.
```