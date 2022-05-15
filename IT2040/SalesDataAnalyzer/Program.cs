using System;
using System.Collections.Generic;
using System.Linq;

namespace SalesDataAnalyzer
{
    class Program
    {
        static void Main(string[] args)
        {
            if (args.Length != 2)
            {
                Console.WriteLine("SalesDataAnalyzer <sales_data_file_path> <report_file_path>");
                Environment.Exit(1);
            }
            string salesDataPath = args[0];
            string reportFilePath = args[1];

            List<Sales> salesList = null;
            try
            {
                salesList = SalesDataLoader.Load(salesDataPath);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(2);
            }

            var report = SalesReport.GenerateText(salesList);
            try
            {
                System.IO.File.WriteAllText(reportFilePath, report);
            }
            catch (Exception e)
            {
                Console.WriteLine(e.Message);
                Environment.Exit(3);
            }
        }
    }
}
