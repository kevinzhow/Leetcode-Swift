// Source : https://leetcode.com/problems/two-sum/
// Demo   ：http://swiftlang.ng.bluemix.net/#/repl/57af57203451d5f71ad95d38
// Author : Kevin Zhow
// Date   : 2016-08-14
/****
 Given an array of integers, return indices of the two numbers such that they add up to a specific target.

 You may assume that each input would have exactly one solution.

 Example:
 Given nums = [2, 7, 11, 15], target = 9,

 Because nums[0] + nums[1] = 2 + 7 = 9,
 return [0, 1].
 ****/

class Solution {
    // The most easy one, but run-time cmplexity
    func twoSum(nums:[Int], target: Int) -> [Int] {
        for (index, num) in nums.enumerated() {
            for (tempIndex, tempNum) in nums.enumerated() {
                if num + tempNum == target && index != tempIndex {
                    return [index, tempIndex]
                }
            }
        }
        return []
    }

    // Use hash to boost search performance
    func twoSumAdvanced(nums: [Int], target: Int) -> [Int] {
        var answerNums: [Int:Int] = [:]

        for (index, num) in nums.enumerated() {
            if let answer = answerNums[num] {
                return [answer, index]
            } else {
                // Store completeNum with current index to have an faster ending when we meet completeNum
                let completeNum = target - nums[index]
                answerNums[completeNum] = index
            }
        }
        return []
    }
}

let solution = Solution()
let result = solution.twoSum(nums: [3, 2, 4], target: 6)
let resultAdvanced = solution.twoSumAdvanced(nums: [3, 2, 4], target: 6)
