class Solution:
    def isPalindrome(self, x: int) -> bool:
        num = str(x)
        rev = ''
        for c in reversed(num):
            rev += c
        return num == rev
