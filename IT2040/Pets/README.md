_Project Name: Pets_

_Target Platform: .NET Core Console Application_

_Programming Language: C#_

# Challenge: Pets

Create a program in C# called Pets that contains `Pet`, `Dog`, and `Cat` classes where `Pet` in the base class and `Dog` and `Cat` are subclasses (derived/child) of `Pet`. The classes are to be tested using the test code provided in this document.

The Pet class is to be created in a file called **Pet.cs**.

The Pet class is to have four **private** properties: `type`, `name`, `owner`, and `weight`. The `type` property is to be a string that specifies the type of pet such as “dog”, “cat”, “bird”, etc. The `name` property is to be a string that specifies the name of the pet. The `owner` property is to be a string that is the name of the owner of the pet. And, the `weight` property is to be a double that specifies the weight of the pet in pounds.

The Pet class is to have a constructor that accepts `type`, `name`, `owner`, and `weight` to initialize a new instance of a Pet and sets its properties.

The Pet class is to have a public methods (functions) called `getTag()` that returns a string that is the string “If lost, call ” concatenated with the name of the pet’s owner. So, for example, if owner is “Karen”, `getTag()` is to return “If lost, call Karen”. The pet class should also have  methods for:

* getName() returns the value of name
* getType() returns the value of type
* getOwner() returns the value of owner; setOwner (newOwner) sets the value of owner to newOwner.
* getWeight() returns the value of weight; setWeight(newWeight) sets the value of weight to newWeight.

To test the Pet class, the following code can be placed in the Main method of the C# program.
```C#   
Pet pet1 = new Pet("dog", "Shadow", "Jose", 42.6);

Console.WriteLine("Name: " + pet1.getName());
Console.WriteLine("Weight: " + pet1.getWeight());
Console.WriteLine(pet1.getTag());
```

When the above code is run, the following output is generated

> Name: Shadow<br />
> Weight: 42.6 <br />
> If lost, call Jose 

----

## Dog Class
The Dog class is to be created in a file called Dog.cs and is to be a subclass of the Pet class.

The Dog class has no additional new properties beyond what the Pet class supplies. Therefore, a Dog class has the Pet properties that it inherits: `type`, `name`, `owner`, and `weight`.

The Dog class is to have a constructor that accepts `name`, `owner`, and `weight` to initialize a new instance of a Dog and set its properties. To do this, the Dog class constructor is to call the superclass (Pet) constructor using base() (Links to an external site.). When the superclass constructor is called, the type is to be automatically set to “dog”.

The Dog class inherits the `getTag()` method. `getTag()` is available to Dog because it inherited it from the Pet class.

The Dog class is to have a public method called **bark** that returns a string with a quantity of “bark!” concatenated together. The number of “bark!” in the returned string is based on a int parameter of bark called `count` that specifies the quantity. The following is the declaration of the bark method.

```C#
public string bark(int count) 
{
	// put code to generate string here
}
```
If count is 4, the output of bark would be: **bark!bark!bark!bark!**

To test the Dog class, the following code can be placed in the Main method of the C# program.

```C#
Dog dog1 = new Dog("Daisy", "Kent", 23.4);

Console.WriteLine("Name: " + dog1.getName());
Console.WriteLine("Weight: " + dog1.getWeight());
Console.WriteLine(dog1.getTag());
Console.WriteLine(dog1.bark(4));
```

When the above code is run, the following output is generated.

>Name: Daisy <br/>
>Weight: 23.4 <br/>
>If lost, call Kent <br/>
>bark!bark!bark!bark!

----

## Cat Class

The Cat class is to be created in a file called Cat.cs and is to be a subclass of the Pet class.

The Cat class has no additional new properties beyond what the Pet class supplies. Therefore, a Cat class has the Pet properties that it inherits: `type`, `name`, `owner`, and `weight`.

The Cat class is to have a constructor that accepts `name`, `owner`, and `weight` to initialize a new instance of a Cat and set its properties. To do this, the Cat class constructor is to call the superclass (Pet) constructor using base() (Links to an external site.). When the superclass constructor is called, the type is to be automatically set to “dog”.

The Cat class inherits the `getTag()` method. `getTag()` is available to Cat because it inherited it from the Pet class.

The Cat class is to have a public method called meow that returns a string with a quantity of “**meow.**” concatenated together. The number of “meow.” in the returned string is based on a int parameter of meow called count that specifies the quantity. The following is the declaration of the meow method.

```C#
 public string meow(int count)
{
	// put code to generate string here
}
```

If count is 3, the output of meow would be: **meow.meow.meow**.

To test the Cat class, the following code can be placed in the Main method of the C# program.

```C#
Cat cat1 = new Cat("Simba", "Maria", 5.2);

Console.WriteLine("Name: " + cat1.getName());
Console.WriteLine("Weight: " + cat1.getweight());
Console.WriteLine(cat1.getTag());
Console.WriteLine(cat1.meow(3));
```

When the above code is run, the following output is generated.

> Name: Simba<br/>
> Weight: 5.2<br/>
> If lost, call Maria<br/>
> meow.meow.meow.

