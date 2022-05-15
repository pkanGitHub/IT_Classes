using System;
using System.IO;
using System.Collections.Generic;

namespace Document
{
    class Program
    {
        static void Main(string[] args)
        {
            bool saveAnotherFile = true;
            while (saveAnotherFile)
            {
                Console.WriteLine("Document\n");
                var docName = documentName();

                writeDataToFile(docName);
                readFileContents(docName);
                Console.WriteLine("Would you like to save another file? (type 'YES' or 'Y' if you do)");
                saveAnotherFile = didUserWantToSaveAnotherDocument(Console.ReadLine());
            }
        }

        static void writeDataToFile(string fileName)
        {
            StreamWriter fileWriter = File.AppendText(fileName);

            Console.WriteLine("Enter content: ");
            string contentData = Console.ReadLine();

            try
            {
                fileWriter.WriteLine(contentData);
                fileWriter.Close();
            }
            catch (Exception err)
            {
                Console.WriteLine($"Expection: {err.Message}, would you like to save another file? (type 'YES' or 'Y' if you do)");
            }
        }

        static void readFileContents(string fileName)
        {
            // CREATE A FILE HANDLER
            StreamReader fileReader = new StreamReader(fileName);
            try
            {
                int count = 0;
                while (!fileReader.EndOfStream)
                {
                    //read file
                    string content = fileReader.ReadLine();
                    count += content.Length;
                }
                Console.WriteLine($"{fileName} was successfully saved. The document contains {count} characters.");
                // Close file
                fileReader.Close();
            }
            catch (Exception err)
            {
                Console.WriteLine($"Exception: {err.Message}, would you like to save another file? (type 'YES' or 'Y' if you do)");
            }
        }
        static string documentName()
        {
            Console.WriteLine("Enter your Document name: ");

            var docName = Console.ReadLine();
            if (docName.Contains("."))
            {
                return docName;
            }
            else
            {
                return docName + ".txt";
            }
        }
        static bool didUserWantToSaveAnotherDocument(string answer)
        {
            if ("YES" == answer.ToUpper() || "Y" == answer.ToUpper())
            {
                return true;
            }
            else
            {
                return false;
            }
        }
    }
}
