class Solution:
    def mySqrt(self, x: int) -> int:
        nums = list(range(x))
        lo, guess, hi = nums[0], nums[len(nums)//2], nums[-1]
        while len(nums) > 1:
            if guess * guess == x:
                return guess
            elif guess * guess > x:
                # we can chop off any larger numbers
                nums = nums[lo:guess]
                guess = nums[len(nums)//2]
            else:
                # we can chop off any smaller numbers
                nums = nums[guess:hi]
                guess = nums[len(nums)//2]
        return nums[0]
