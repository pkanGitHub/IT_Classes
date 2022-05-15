using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;

namespace SalesDataAnalyzer
{
    public static class SalesReport
    {
        public static string GenerateText(List<Sales> salesList)
        {
            string report = "Sales Report\n";
            if (salesList.Count() < 1)
            {
                report += "No data is available.\n";
                return report;
            }
            // List all the items sold to customers in Australia (stockCode and Description).
            report += "\nItems sold in Australia: ";
            var ItemsSoldInAustralia = from sales in salesList where sales.Country == "Australia" select new { stockC = sales.StockCode, description = sales.Description };
            foreach (var item in ItemsSoldInAustralia)
            {
                report += $"\n{item.stockC} {item.description}";
            }

            // How many individual sales were there? To determine this you have to count the unique invoice numbers. You should group by invoice number?
            var IndividualSalesCount = from sales in salesList
                                       group sales by sales.InvoiceNo into invoiceNoGroup
                                       select new
                                       {
                                           Count = invoiceNoGroup.Count()
                                       };
            report += $"\n\nThere were {IndividualSalesCount.Count()} unique invoice number(individual sales).\n";

            // What is the sales total for invoice number 536365? Sales total for an invoice will be the sum of (Quantity * UnitPrice) for all products sold in the invoice.
            var TotalSalesForInvoice536365 = from sales in salesList where sales.InvoiceNo == "536365" select sales;
            float totalFor536365 = 0.0f;
            foreach (var invNo536365 in TotalSalesForInvoice536365)
            {
                totalFor536365 += invNo536365.Quantity * invNo536365.UnitPrice;
            }
            report += $"\nThe total cost for invoice 536365 is: ${totalFor536365}\n";

            // List the total sales by country?
            report += "\nTOTAL SALES BY COUNTRY:";
            var TotalSalesByCountry = from sales in salesList
                                      group sales by sales.Country into CountryGroup
                                      select CountryGroup;
            foreach (var country in TotalSalesByCountry)
            {
                float countryTotal = 0.0f;
                foreach (var totalByCountry in country)
                {
                    countryTotal += totalByCountry.Quantity * totalByCountry.UnitPrice;
                }
                report += $"\nTotal sales for {country.Key}: ${Math.Round(countryTotal, 2)}";
            }

            // Which customer has spent the most money during the period?
            var MostMoneySpentCustomer = from sales in salesList
                                         group sales by sales.CustomerID into CustomerIDGroup
                                         select CustomerIDGroup;
            float maxSpent = 0.0f;
            string customer, maxSpentCustomer = "";
            foreach (var customerID in MostMoneySpentCustomer)
            {
                customer = customerID.Key;
                float eachCustomerSpent = 0.0f;
                foreach (var totalSpent in customerID)
                {
                    eachCustomerSpent = totalSpent.Quantity * totalSpent.UnitPrice;
                }
                if (eachCustomerSpent > maxSpent)
                {
                    maxSpent = eachCustomerSpent;
                    maxSpentCustomer = customer;
                }
            }
            report += $"\n\nCustomer {maxSpentCustomer} has spent the most with ${maxSpent:0.00}";


            // What are the total sales to customer 15311?
            var TotalSalesToCustomer15311 = from sales in salesList where sales.CustomerID == "15311" select sales;
            float totalFor15311 = 0.0f;
            foreach (var customer15311 in TotalSalesToCustomer15311)
            {
                totalFor15311 = customer15311.Quantity * customer15311.UnitPrice;
            }
            report += $"\n\nTotal sales for customer 15311 is: ${totalFor15311}\n";

            // How many units of “HAND WARMER UNION JACK” were sold in the dataset?
            var UnitsOfHandWarmerUnionJackWereSold = from sales in salesList where sales.Description == "HAND WARMER UNION JACK" select sales;
            int unitsHWUJSold = 0;
            foreach (var unitsHWUJ in UnitsOfHandWarmerUnionJackWereSold)
            {
                unitsHWUJSold += unitsHWUJ.Quantity;
            }
            report += $"\n{unitsHWUJSold} of “HAND WARMER UNION JACK” were sold.\n";

            // What was the total value of the “HAND WARMER UNION JACK” sales in the dataset?
            var TotalOfHandWarmerUnionJack = from sales in salesList where sales.Description == "HAND WARMER UNION JACK" select sales;
            float valueForHWUJ = 0.0f;
            foreach (var valueHWUJ in TotalOfHandWarmerUnionJack)
            {
                valueForHWUJ += valueHWUJ.Quantity * valueHWUJ.UnitPrice;
            }
            report += $"\nTotal value of the “HAND WARMER UNION JACK” is: ${Math.Round(valueForHWUJ, 2)}\n";

            // Which product has the highest UnitPrice (stockCode and Description).?
            var ProductWithHighestUnitPrice = from sales in salesList
                                                  //   group sales by sales.UnitPrice into UnitPriceGroup
                                              orderby sales.UnitPrice descending
                                              select new { stockcode = sales.StockCode, description = sales.Description };
            report += $"\nStock Code:{ProductWithHighestUnitPrice.First().stockcode}, Description:{ProductWithHighestUnitPrice.First().description}\n";


            // What is the total sales for the entire dataset?
            var TotalSalesForEntireDataset = from sales in salesList select new { salesMultiply = sales.Quantity * sales.UnitPrice };
            float addMultipliedNum = 0.0f;
            foreach (var multipliedNo in TotalSalesForEntireDataset)
            {
                addMultipliedNum += multipliedNo.salesMultiply;
            }
            report += $"\nThe total sales for entire dataset is ${addMultipliedNum}\n";

            // Which invoice number had the highest sales?
            var InvoNoWithHighestSales = from sales in salesList
                                         group sales by sales.InvoiceNo into InvoiceNoGroup
                                         select InvoiceNoGroup;
            string invoiceNumber, maxInvNo = "";
            float maxSalesTotal = 0.0f;
            foreach (var invNumber in InvoNoWithHighestSales)
            {
                invoiceNumber = invNumber.Key;
                float invSalesTotal = 0.0f;
                foreach (var invSales in invNumber)
                {
                    invSalesTotal += invSales.Quantity * invSales.UnitPrice;
                }
                if (invSalesTotal > maxSalesTotal)
                {
                    maxSalesTotal = invSalesTotal;
                    maxInvNo = invoiceNumber;
                }
            }
            report += $"\nInvoice Number {maxInvNo} had the highest sales of ${maxSalesTotal:0.00}\n";

            // Which product sold the most units?
            var ProductSoldTheMostUnits = from sales in salesList
                                          group sales by sales.Description into DescriptionGroup
                                          select DescriptionGroup;
            string productDescription, mostUnitsSold = "";
            int mostQuantity = 0;
            foreach (var product in ProductSoldTheMostUnits)
            {
                productDescription = product.Key;
                int quantity = 0;
                foreach (var des in product)
                {
                    quantity += des.Quantity;
                }
                if (quantity > mostQuantity)
                {
                    mostQuantity = quantity;
                    mostUnitsSold = productDescription;
                }
            }
            report += $"\n{mostUnitsSold} sold the most unit of {mostQuantity} units";
            return report;
        }
    }
}

