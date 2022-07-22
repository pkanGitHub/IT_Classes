import unittest
from userPrompt import *
from datetime import datetime
    
class TestApp(unittest.TestCase):
    symbol = get_symbol()
    chart = get_chart_type()
    time_series = get_time_series()

    def setUp(self):
        pass

    #symbol: capitalized, 1-7 alpha characters
    def test_symbol(self):
        symbolLen = len(self.symbol)
        self.assertGreaterEqual(symbolLen, 1, msg = "You need at least 1 character")
        self.assertLessEqual(symbolLen, 7, msg = "The string cannot be more than 7 characters")
        self.assertEqual(self.symbol.isalpha(), True)
        self.assertTrue(self.symbol.isupper(), msg = "symbol isn't in upper case")
    
    # chart type: 1 numeric character, 1 or 2
    def test_chart(self):
        self.assertEqual(type(self.chart), int, True)
        self.assertIn(self.chart, [1,2], msg = "You can only select 1 or 2")

    # time series: 1 numeric character, 1 - 4
    def test_time_series(self):
        self.assertEqual(type(self.time_series), int, True)
        self.assertIn(self.time_series, [1, 2, 3, 4], msg = "You can only select 1, 2, 3, or 4")
    
    # combine test for start/end date
    def test_dates(self):
        format = "%Y-%m-%d"
        result = True

        start_date = get_start_date()
        is_start_date = bool(datetime.strptime(start_date, format))
        self.assertEqual(is_start_date, result)

        end_date = get_end_date(start_date)
        is_end_date = bool(datetime.strptime(end_date, format))
        self.assertEqual(is_end_date, result)
        self.assertLess(start_date, end_date)


if __name__ == "__main__":
    unittest.main()


""" (<<<--- exception)
class ChartExcept(Exception):
    pass

class TimeSeriesExcept(Exception):
    pass

class StartDateExcept(Exception):
    pass

class EndDateExcept(Exception):
    pass

def throw_ex(input):
    if not isinstance(input, int):
        raise ChartExcept("Input must be integer")
    elif not isinstance(input, int):
        raise TimeSeriesExcept("Input must be integer")
    else:
        return True

def throw_date_ex(input):
    format = "%Y-%m-%d"
    result = True
    result = bool(datetime.strptime(input, format))

    if not result:
        raise StartDateExcept("Start Date must be in YYYY-MM-DD format")
    elif not result:
        raise EndDateExcept("End Date must be in YYYY-MM-DD format")
    else:
        return True
""" 
"""
example exception inside of the functions:

        # with self.assertRaises(ChartExcept) as context:
        #     throw_ex(self.chart)
        # print(context.exception) 
""" #(<<<--- exception)