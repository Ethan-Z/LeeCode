import UIKit


/*
 实现 strStr() 函数。
 
 给定一个 haystack 字符串和一个 needle 字符串，在 haystack 字符串中找出 needle 字符串出现的第一个位置 (从0开始)。如果不存在，则返回  -1。
 
 示例 1:
 
 输入: haystack = "hello", needle = "ll"
 输出: 2
 
 示例 2:
 
 输入: haystack = "aaaaa", needle = "bba"
 输出: -1
 
 说明:
 
 当 needle 是空字符串时，我们应当返回什么值呢？这是一个在面试中很好的问题。
 
 对于本题而言，当 needle 是空字符串时我们应当返回 0 。这与C语言的 strstr() 以及 Java的 indexOf() 定义相符。

 */



// 这个算法, 虽然可以解决问题, 但是 当haystack,和 needle 长度都很长, 则会超时
func strStr(_ haystack: String, _ needle: String) -> Int {
    
    if needle == "" || haystack == needle{
        return 0
    }

    if !haystack.contains(needle){
        return -1
    }
    // 以第二个字符串 对第一个字符串进行切割, 获取切割后的数组第一个元素, 它的长度就是答案
    return haystack.components(separatedBy: needle).first!.count
}

// 使用KMP 算法.
func strStr2(_ haystack: String, _ needle: String) -> Int {
    
   return 2
}


strStr("a", "")



