using System;
using System.IO;

namespace DocumentMerger
{
    class Program
    {
        static void Main(string[] args)
        {
            bool mergeAnotherFiles = true;
            while (mergeAnotherFiles)
            {
                Console.WriteLine("Document Merger\n");
                string[] docNames = new string[3];
                docNames[0] = getDocumentName("first");
                docNames[1] = getDocumentName("second");

                string removeExt = Path.GetFileNameWithoutExtension(docNames[0]);
                docNames[2] = (removeExt + docNames[1]);
                Console.WriteLine($"Your new file name: {docNames[2]}");

                string content = readFileContents(docNames[0]) + "\n" + readFileContents(docNames[1]);
                writeDataToFile(docNames[2], content);
                readFileContents(docNames[2]);

                Console.WriteLine("Would you like to merge another files? (type 'YES' or 'Y' if you do)");
                mergeAnotherFiles = didUserWantToMergeAnotherDocuments(Console.ReadLine());
            }

            static void writeDataToFile(string fileName, string content)
            {
                StreamWriter combinedFile = File.AppendText(fileName);

                try
                {
                    combinedFile.WriteLine(content);
                    combinedFile.Close();
                }
                catch (Exception err)
                {
                    Console.WriteLine($"Expection: {err.Message}");
                }
            }

            static string readFileContents(string fileName)
            {
                // CREATE A FILE HANDLER
                StreamReader fileReader = new StreamReader(fileName);
                string content = "";
                int count = 0;
                try
                {
                    while (!fileReader.EndOfStream)
                    {
                        //read file
                        content = content + fileReader.ReadLine();
                        count = content.Length;
                    }
                    Console.WriteLine($"{fileName} was successfully saved. The document contains {count} characters");
                    // Close file
                    fileReader.Close();
                }
                catch (Exception err)
                {
                    Console.WriteLine($"Exception: {err.Message}");
                }
                return content;
            }

            static string getDocumentName(string n)
            {
                Console.WriteLine("Enter your " + n + " document name: ");
                string docName = Console.ReadLine();
                string docWithExt = appendDotTxt(docName);

                bool docExists = checkIfDocNameExist(docWithExt);
                Console.WriteLine($"File Name: {docWithExt}");
                do
                {
                    Console.WriteLine("The file doesn't exist. Please enter your file name again: ");
                    docWithExt = appendDotTxt(Console.ReadLine());
                    Console.WriteLine($"File Name: {docWithExt}");
                    docExists = checkIfDocNameExist(docWithExt);
                } while (!docExists);

                return docWithExt;
            }

            static string appendDotTxt(string docName)
            {
                if (docName.EndsWith(".txt"))
                {
                    return docName;
                }
                else
                {
                    return docName + ".txt";
                }
            }

            static bool checkIfDocNameExist(string docName)
            {
                if (File.Exists(docName))
                {
                    return true;
                }
                else
                {
                    return false;
                }
            }

            static bool didUserWantToMergeAnotherDocuments(string answer)
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
}
