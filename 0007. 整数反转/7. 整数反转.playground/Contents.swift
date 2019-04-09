import UIKit



/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。
 
 示例 1:
 
 输入: 123
 输出: 321
 
 示例 2:
 
 输入: -123
 输出: -321
 
 示例 3:
 
 输入: 120
 输出: 21
 
 注意:
 
 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2的31次方,  2的31次方 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。

 */


//这种利用了. String的reversed 方法来实现这个问题.这其实是一种取巧的方式,  然而实现这个转换才是这道题的本意.
func reverse(_ x: Int) -> Int {
    
    let isPositive = x >= 0
    var newValue = abs(x)
    newValue = Int(String(String(newValue).reversed()))!
    
    if newValue > Int32.max || newValue < Int32.min {
        return 0
    }
    return isPositive ? newValue : -newValue
}


//真正解法
func reverse2(_ x: Int) -> Int {
    
    let isPositive = x >= 0
    var result = 0
    var temp = abs(x)
    while temp > 0 {
        let last = temp % 10
        result = result*10 + last
        temp /= 10
        if result > Int32.max{
            return 0
        }
    }
    return isPositive ? result : -result
}

Int32.max
reverse(123)
reverse(1534236469)

reverse2(123)
reverse2(1534236469)
