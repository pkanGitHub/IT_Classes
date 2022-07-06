# Anagram & Palindrome Algorithm and Big-O with Description

## First to check if two strings are anagrams:
```
string1 = dictionary
string2 = indicatory
```
1. Sort `string1` and `string2` in alphabetical order. 
2. Make sure the string has all the letters after it's been sorted (include multiple same vows).
3. Then check if both strings match:
```python
# after sorting both string1 and string2, compare them:

if string1 == string2:
    print("It is Anagram")
else:
    print("It is not Anagram")

```
Since from the example strings given above, **BOTH** string will output something similar to `"acdiinorty"`. Therefore, it is an Anagram.

**Time complexity for this algorithm is** `O(n log n)`

---


## Second check if strings are palindromes:

1. Take the **REVERSE** of `string1`
2. Then compares it to `string2` to see if they are the same.
```python
if reverseOfString1 == string2:
    print("They are palindromes")
else:
    print("They are not palindromes")

# string1: yranoitcid
# string2: indicatory
```
Since the output of 2 strings do not match; therefore, they are not palindrome. However, if:

```
string1 = level
string2 = level
```
The reverse of `string1` will be the same as `string2`; therefore, it is Palindrome

**Time complexity for this algorithm is** `O(n)`

---

## Instruction
- `cd` to the directory where the python file is located.
- Run this file with `python Anagram_Palindrom_BigO.py` command.
- Once it is ran, it'll prompt the user for first and second string. 
    ```
    Enter first string: <type a string>
    Enter second string: <type a string>
    ```
- After user input the second string, the result whether both string are anagram and palindrome will display
