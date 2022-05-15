using System;
using System.Collections.Generic;
using System.IO;

namespace SalesDataAnalyzer
{
    public static class SalesDataLoader
    {
        private static int NumItemsInRow = 8;
        public static List<Sales> Load(string salesDataPath)
        {
            List<Sales> salesList = new List<Sales>();

            try
            {
                using (var reader = new StreamReader(salesDataPath))
                {
                    int lineNumber = 0;
                    while (!reader.EndOfStream)
                    {
                        var line = reader.ReadLine();
                        lineNumber++;
                        if (lineNumber == 1) continue;

                        var values = line.Split(',');
                        if (values.Length != NumItemsInRow)
                        {
                            throw new Exception($"Row {lineNumber} contains {values.Length} values. It should contains {NumItemsInRow}.");
                        }
                        try
                        {
                            string invoiceNo = values[0];
                            string stockCode = values[1];
                            string description = values[2];
                            int quantity = Int32.Parse(values[3]);
                            string invoiceDate = values[4];
                            float unitPrice = Convert.ToSingle(values[5]);
                            string customerID = values[6];
                            string country = values[7];
                            Sales sales = new Sales(invoiceNo, stockCode, description, quantity, invoiceDate, unitPrice, customerID, country);
                            salesList.Add(sales);
                        }
                        catch (FormatException e)
                        {
                            throw new Exception($"Row {lineNumber} contains invalid data. ({e.Message}).");
                        }
                    }
                }
            }
            catch (Exception e)
            {
                throw new Exception($"Unable to open {salesDataPath} ({e.Message}.)");
            }
            return salesList;
        }
    }
}