using System;

namespace Pets
{
    class Program
    {
        static void Main(string[] args)
        {
            Pet pet1 = new Pet("dog", "Shadow", "Jose", 42.6);

            Console.WriteLine("Name: " + pet1.GetName());
            Console.WriteLine("Weight: " + pet1.GetWeight());
            Console.WriteLine(pet1.GetTag());

            Dog dog1 = new Dog("Daisy", "Kent", 23.4);

            Console.WriteLine("\nName: " + dog1.GetName());
            Console.WriteLine("Weight: " + dog1.GetWeight());
            Console.WriteLine(dog1.GetTag());
            Console.WriteLine(dog1.Bark(4));

            Cat cat1 = new Cat("Simba", "Maria", 5.2);

            Console.WriteLine("\nName: " + cat1.GetName());
            Console.WriteLine("Weight: " + cat1.GetWeight());
            Console.WriteLine(cat1.GetTag());
            Console.WriteLine(cat1.Meow(3));

        }
    }
}
