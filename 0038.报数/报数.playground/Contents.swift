import UIKit


/*
 报数序列是一个整数序列，按照其中的整数的顺序进行报数，得到下一个数。其前五项如下：
 
 1.     1
 2.     11
 3.     21
 4.     1211
 5.     111221
 1 被读作  "one 1"  ("一个一") , 即 11。
 11 被读作 "two 1s" ("两个一"）, 即 21。
 21 被读作 "one 2",  "one 1" （"一个二" ,  "一个一") , 即 1211。
 
 给定一个正整数 n（1 ≤ n ≤ 30），输出报数序列的第 n 项。
 
 注意：整数顺序将表示为一个字符串。
 
   
 
 示例 1:
 
 输入: 1
 输出: "1"
 示例 2:
 
 输入: 4
 输出: "1211"
 
 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/count-and-say
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 */




func countAndSay(_ n: Int) -> String {
    
    if n <= 1 {
        return "1"
    }
    
    var preStr = "1"
    
    for _ in 2...n {
        var currentStr = ""
        var topChar : Character = preStr.first!
        var charCount = 0
        for (index, j) in preStr.enumerated() {
            
            if j == topChar {
                charCount += 1
            }else{
                currentStr = currentStr + String(charCount) + String(topChar)
                topChar = j
                charCount = 1
            }
            //最后一个字符,需要单独添加
            if ( index == preStr.count - 1 ){
                currentStr = currentStr + String(charCount) + String(preStr.last!)
                preStr =  currentStr
                
            }
        }
    }

    return preStr
}

countAndSay(1)
