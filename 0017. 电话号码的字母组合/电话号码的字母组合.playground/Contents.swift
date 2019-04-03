import UIKit

var str = "Hello, playground"


/*
 
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。
 
 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 
 
 示例:
 
 输入："23"
 输出：["ad", "ae", "af", "bd", "be", "bf", "cd", "ce", "cf"].
 
 说明:
 尽管上面的答案是按字典序排列的，但是你可以任意选择答案输出的顺序。
 */


func letterCombinations(_ digits: String) -> [String] {
    
    let phoneKey : [String : [String]] = [
        "2" : ["a","b","c"],
        "3" : ["d","e","f"],
        "4" : ["g","h","i"],
        "5" : ["j","k","l"],
        "6" : ["m","n","o"],
        "7" : ["p","q","r","s"],
        "8" : ["t","u","v"],
        "9" : ["w","x","y","z"],
    ]
    
    if(digits.count < 1) {
        return []
    }
    //获取到第一个字符对应的字符集
    var resultArr : [String] = phoneKey[String(digits.first!)]!
    for char in digits.dropFirst(){
        let charStrArr = phoneKey[String(char)]!
        resultArr = charStrArr.map { charStr in  //遍历这个字符集
            resultArr.map({ str in  // 将结果数组加入这个字符串,
                str + charStr
            })
        }  // 这时返回的是[[String]] 的格式. 需要将之展平
        .flatMap{$0}
    }
    return resultArr
}


letterCombinations("234")
