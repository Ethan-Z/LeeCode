import UIKit
/*
 在歌曲列表中，第 i 首歌曲的持续时间为 time[i] 秒。
 
 返回其总持续时间（以秒为单位）可被 60 整除的歌曲对的数量。形式上，我们希望索引的数字  i < j 且有 (time[i] + time[j]) % 60 == 0。
 
 
 
 示例 1：
 
 输入：[30,20,150,100,40]
 输出：3
 解释：这三对的总持续时间可被 60 整数：
 (time[0] = 30, time[2] = 150): 总持续时间 180
 (time[1] = 20, time[3] = 100): 总持续时间 120
 (time[1] = 20, time[4] = 40): 总持续时间 60
 
 示例 2：
 
 输入：[60,60,60]
 输出：3
 解释：所有三对的总持续时间都是 120，可以被 60 整数。

 */

// 这种方式解法虽然简单, 但是不能通过, 因为一但这个数组很大, 就容易超时

func numPairsDivisibleBy60(_ time: [Int]) -> Int {
    var count = 0
    for (index, value) in time.enumerated() {
       time.dropFirst(index+1)
            .map{ value2 in
            if (value + value2) % 60 == 0 {
                count += 1
            }
        }
    }
    return count
}


// 分析题目可以知道, 其实真正需要匹配的值只有60个, 只要统计他们的个数,然后再用这个个数来统计总数

func numPairsDivisibleBy60_2(_ time: [Int]) -> Int {
    
    var count = 0
    var arr =  Array(repeating: 0, count: 60)
    for value in time{
        arr[value % 60] += 1
    }
    for i in 0...30{
        if i == 0 || i == 30{
            count += arr[i] > 1 ? (arr[i] * (arr[i] - 1) / 2) : 0
        }else{
            count += arr[i]*arr[60 - i]
        }
    }
    return count
}

numPairsDivisibleBy60_2([30,20,150,100,40])
