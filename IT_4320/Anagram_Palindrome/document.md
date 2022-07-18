# Anagram & Palindrome Algorithm and Big-O with Description

## First to check if two strings are anagrams:
```python
string1 = dictionary
string2 = indicatory


check if both length are the same
    if not it will return false

# create a container to store the value
container = {}

# iterate through string1 
for item in range(length of string1):
    #check in the container to see if letter already exist
    if letter already exist, then += 1
    else set it to equal 1

#store the container keys into a variable to check the result
variable = container.keys()
#iterate through the variable
for each key in this variable:
    print(container[each key])
```
output:
```python
{
    1 #d
    2 #i
    1 #c
    1 #t
    1 #o
    1 #n
    1 #a
    1 #r
    1 #y 
}
```
then,
```python
# iterate through string2
for item in range(length of string2):
# check to see the letter appeared in string2 already been counted in the container, then decrease the count by 1
    if each item of string2 in container:
        each item of string2 in container -= 1

# and again do this to check result
variable = container.keys()
#iterate through the variable
for each key in this variable:
    print(container[each key])
```
output: 
```python
{
    0
    0
    0
    0
    0
    0
    0
    0
    0
}
```

check if the elements equal 0.

in this case, it is true, so it is anagram.

---


## Second check if strings are palindromes:
```python
string1 = dictionary
string2 = indicatory

```

1. Take the **REVERSE** of `string1`
2. Then compares it to `string2` to see if they match.
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

---
 **Therefore, the Big-O notation of this code is** `O(n)`
---
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
