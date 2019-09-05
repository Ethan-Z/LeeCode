import UIKit
/*
给定一个未排序的整数数组，找出其中没有出现的最小的正整数。

示例 1:

输入: [1,2,0]
输出: 3
示例 2:

输入: [3,4,-1,1]
输出: 2
示例 3:

输入: [7,8,9,11,12]
输出: 1
说明:

你的算法的时间复杂度应为O(n)，并且只能使用常数级别的空间。

来源：力扣（LeetCode）
链接：https://leetcode-cn.com/problems/first-missing-positive
著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
*/


//解题思路
//由于是要找出数组中没有出现的最小的正整数, 也就是说 1...arr.count+1必定一个数在其中. 只要从小遍历并判断是否包含,就能获得最小最小正整数 

func firstMissingPositive(_ nums: [Int]) -> Int {
    
    if nums.count <= 0{
        return 1
    }
    
    for i in 1...nums.count + 1 {
        
        if( !nums.contains(i) ) {
            return i
        }
    }
    return 0
}
