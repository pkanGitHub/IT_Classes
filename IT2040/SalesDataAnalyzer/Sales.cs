using System;

namespace SalesDataAnalyzer
{
    public class Sales
    {
        public string InvoiceNo, StockCode, Description, InvoiceDate, CustomerID, Country;
        public float UnitPrice;
        public int Quantity;
        public Sales(string invoiceNo, string stockCode, string description, int quantity, string invoiceDate, float unitPrice, string customerID, string country)
        {
            InvoiceNo = invoiceNo;
            StockCode = stockCode;
            Description = description;
            Quantity = quantity;
            InvoiceDate = invoiceDate;
            UnitPrice = unitPrice;
            CustomerID = customerID;
            Country = country;
        }
    }
}