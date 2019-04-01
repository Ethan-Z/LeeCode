import UIKit

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。
 你可以假设每种输入只会对应一个答案。但是，你不能重复利用这个数组中同样的元素。
 示例:
 给定 nums = [2, 7, 11, 15], target = 9
 
 因为 nums[0] + nums[1] = 2 + 7 = 9
 
 所以返回 [0, 1]
 */

// 未使用 使用暴力遍历方法.
func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    var indexs = [Int]()
    for (index, value) in nums.enumerated(){
        var operArr = nums
        let subNum = target - value
        operArr.remove(at: index)
        if operArr.contains(subNum){
            let index2 : Int
            if subNum == value {
                index2 = operArr.index{ $0 == subNum }! + 1
            }else{
                index2 = nums.index{ $0 == subNum }!
            }
            indexs.append(contentsOf: [index, index2])
            break
        }
    }
    return indexs
}

//使用hash 来优化




