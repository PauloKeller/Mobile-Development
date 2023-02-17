import UIKit

func rotate(nums: [Int], times: Int) -> [Int] {
  var result = [Int]()
  var copy = nums
  
  for index in 0...times-1 {
    let temp = nums[index]
    copy.remove(at: 0)
    result.insert(temp, at: result.count)
  }
  
  result.insert(contentsOf: copy, at: 0)
  
  return result
}

let nums = [1,2,3,4,5,6,7]

let result = rotate(nums: nums, times: 2)
print(result)
