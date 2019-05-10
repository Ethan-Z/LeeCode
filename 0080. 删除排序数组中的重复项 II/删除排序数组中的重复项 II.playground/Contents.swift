import UIKit

/*
 
 给定一个排序数组，你需要在原地删除重复出现的元素，使得每个元素最多出现两次，返回移除后数组的新长度。
 
 不要使用额外的数组空间，你必须在原地修改输入数组并在使用 O(1) 额外空间的条件下完成。
 
 示例 1:
 
 给定 nums = [1,1,1,2,2,3],
 
 函数应返回新长度 length = 5, 并且原数组的前五个元素被修改为 1, 1, 2, 2, 3 。
 
 你不需要考虑数组中超出新长度后面的元素。
 
 示例 2:
 
 给定 nums = [0,0,1,1,1,1,2,3,3],
 
 函数应返回新长度 length = 7, 并且原数组的前五个元素被修改为 0, 0, 1, 1, 2, 3, 3 。
 
 你不需要考虑数组中超出新长度后面的元素。

 */

func removeDuplicates(_ nums: inout [Int]) -> Int {
    
    if nums.count <= 0{
        return 0
    }
    
    var numCount = 1;
    var preNum = nums.first!
    let numsCory = nums
    var deleteCount = 0
    for (index , value) in numsCory.enumerated(){
        if value == preNum, index != 0 {
            if numCount >= 2{
                nums.remove(at: index - deleteCount)
                deleteCount += 1
            }
            numCount += 1
        }else{
            preNum = value
            numCount = 1

        }
    }
    return nums.count
}


//解法2
func removeDuplicates2(_ nums: inout [Int]) -> Int {
    
    if nums.count <= 0{
        return 0
    }
    var newArr : [Int] = []
    for (index, value) in nums.enumerated() {
        if index < 2 || value != nums[index - 2]{
            newArr.append(value)
        }
        
    }
    nums = newArr
    return nums.count
}


var nums = [0,0,1,1,1,1,2,3,3]

//removeDuplicates2(&nums)
//
//nums

var nums2 = [1,1,1,2,2,2,3,3]


removeDuplicates2(&nums2)

nums2
