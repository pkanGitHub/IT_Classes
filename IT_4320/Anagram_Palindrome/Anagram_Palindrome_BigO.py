def checkAnagram(s1, s2):
    if (len(s1) != len(s2)):
        return False

    map = {}
    for c in range(len(s1)):
        if (s1[c] in map):
            map[s1[c]] += 1
        else:
            map[s1[c]] = 1
    for c in range(len(s2)):
        if (s2[c] in map):
            map[s2[c]] -= 1

    keys = map.keys()
    for key in keys:
        if(map[key] != 0):
            return False
    return True

# Easier way
# def checkAnagram(s1, s2):
#     if sorted(s1) == sorted(s2):
#         return True
#     else:
#         return False
    
def checkPalindrome(s1, s2):
    reverse = ''.join(reversed(s1))
    if (s2 == reverse):
        # print(f"{s2} == {reverse}")
        return True
    else:
        return False

def main():
    s1 = input("Enter first string: ")
    s2 = input("Enter second string: ")
    isAnagram = checkAnagram(s1,s2)
    isPalindrome = checkPalindrome(s1, s2)
    if isAnagram == True and isPalindrome == True:
        print(f"Both strings are Anagram and Palindrome")
    elif isAnagram == True and isPalindrome != True:
        print(f"Both strings are Anagram, but not Palindrome")
    elif isPalindrome != True and isAnagram != True:
        print(f"Both strings are neither Anagram or Palindrome")



# s1 = "dictionary"
# s2 = "indicatory"
# s3 = "level"
# s4 = "level"
# checkAnagram(s1, s2)
# checkPalindrome(s3, s4)
main()