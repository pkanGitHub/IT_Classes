using System;
using System.Collections.Generic;

namespace ImprovedGradeConverter
{
    class Program
    {
        static void Main(string[] args)
        {
            bool continueProgram = true;
            string userName = getName();
            Console.WriteLine($"Hello {userName}. Welcome to the Grade Converter!");

            while (continueProgram)
            {

                int numberOfGrades = getNumberOfGrades();
                List<float> gradeList = populateGradesList(numberOfGrades);
                List<float> gradeListWithLetter = printGradeReport(gradeList);
                float average = getAverageGrade(gradeList, numberOfGrades);
                float maxGrade = getMaximumGrade(gradeList);
                float minGrade = getMinimumGrade(gradeList);
                string avgLetter = convertLetterGrade(average);
                string printStatistics = printGradeStatistics(numberOfGrades, average, avgLetter, maxGrade, minGrade);

                Console.WriteLine($"Do you have more grades to convert? (YES or NO): ");

                continueProgram = didUserWantToContinue(Console.ReadLine());

                average = 0;// reset score
            }
            Console.WriteLine("You entered NO or bad input, the program has ended.");

        }

        //**************
        // functions created for this challenge start here.
        //**************

        // gets the user's first and last name. Returns the first and last name
        static string getName()
        {
            string name;
            Console.WriteLine("Please enter your first and last name: ");
            name = Console.ReadLine();
            return name;
        }

        // gets the number of grades the user wants to enter. Returns the number of grades to enter
        static int getNumberOfGrades()
        {
            int number;
            Console.WriteLine("\nPlease enter the number of grades you need to convert: ");
            number = int.Parse(Console.ReadLine());

            return number;
        }

        // adds the grades the user enters to a list. Returns the list of grades
        static List<float> populateGradesList(int numberOfGrades)
        {
            List<float> gradeList = new List<float>();

            for (int i = 0; i < numberOfGrades; i++)
            {
                float userVal = getGrade();
                gradeList.Add(userVal);
            }
            return gradeList;
        }

        // prints the letter grades and the numerical scores for the grades stored in the grades list e.g. (A score of  89.5 is a B grade)
        static List<float> printGradeReport(List<float> listOfGrades)
        {
            string letter = "";
            float totalGrade = 0; ;

            foreach (float grade in listOfGrades)
            {
                letter = convertLetterGrade(grade);
                Console.WriteLine($"A score of {grade} is a '{letter}' grade");
                totalGrade += grade;
            }
            return listOfGrades;
        }

        // prints the statistics for the grades list. (number of grades, average grade, maximum grade, minimum grade)
        static string printGradeStatistics(int numberOfGrades, float average, string avgLetter, float max, float min)
        {
            string stat = "";
            Console.WriteLine("\nGrade Statistics");
            Console.WriteLine("------------------");
            Console.WriteLine($"The number of grades: {numberOfGrades}");
            // Console.WriteLine($"Average Grade: {average}");
            Console.WriteLine($"Average Grade: {average}, which is the letter {avgLetter}");
            Console.WriteLine($"The highest grade is: {max}");
            Console.WriteLine($"The lowest grade is: {min}");
            return stat;
        }

        // calculates and returns the average grade
        static float getAverageGrade(List<float> listOfGrades, int numberOfGrades)
        {
            float totalGrade = 0;
            foreach (float grade in listOfGrades)
            {
                totalGrade += grade;
            }
            float average = totalGrade / numberOfGrades;

            return average;
        }

        // returns the highest grade in the list of grades
        static float getMaximumGrade(List<float> listOfGrades)
        {
            float maxGrade = 0;
            foreach (float grade in listOfGrades)
            {
                if (grade > maxGrade)
                {
                    maxGrade = grade;
                }
            }
            return maxGrade;
        }

        // returns the lowest grade in the list of grades
        static float getMinimumGrade(List<float> listOfGrades)
        {
            float minGrade = float.PositiveInfinity;
            foreach (float grade in listOfGrades)
            {
                if (grade < minGrade)
                {
                    minGrade = grade;
                }
            }
            return minGrade;
        }

        // functions from prev challenge
        static bool didUserWantToContinue(string answer)
        {
            if ("YES" == answer.ToUpper())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        static float getGrade()
        {
            float numberGrade;
            do
            {
                try
                {
                    // prompt user to enter
                    Console.WriteLine("Please enter a grade: ");
                    // get value from console
                    numberGrade = float.Parse(Console.ReadLine());
                    break;
                }
                catch (Exception)
                {
                    Console.WriteLine("There was an error. Please enter a valid grade: ");
                }
            } while (true);
            return numberGrade;
        }

        static string convertLetterGrade(float numberGrade)
        {
            string letter = "";

            if (numberGrade >= 90 && numberGrade <= 100)
            {
                letter = "A";
            }
            else if (numberGrade >= 80 && numberGrade < 90)
            {
                letter = "B";
            }
            else if (numberGrade >= 70 && numberGrade < 80)
            {
                letter = "C";
            }
            else if (numberGrade >= 60 && numberGrade < 70)
            {
                letter = "D";
            }
            else if (numberGrade < 60)
            {
                letter = "F";
            }
            return letter;
        }
    }
}
