import UIKit

/*
 给定字符串J 代表石头中宝石的类型，和字符串 S代表你拥有的石头。 S 中每个字符代表了一种你拥有的石头的类型，你想知道你拥有的石头中有多少是宝石。
 
 J 中的字母不重复，J 和 S中的所有字符都是字母。字母区分大小写，因此"a"和"A"是不同类型的石头。
 
 示例 1:
 
 输入: J = "aA", S = "aAAbbbb"
 输出: 3
 
 示例 2:
 
 输入: J = "z", S = "ZZ"
 输出: 0
 
 注意:
 
 S 和 J 最多含有50个字母。
 J 中的字符不重复。
 

 */

//未优化, 使用两次遍历

func numJewelsInStones(_ J: String, _ S: String) -> Int {
    var count = 0
    for (_, Jchar) in J.enumerated(){
        for (_, Schar) in S.enumerated(){
            if Jchar == Schar{
                count += 1
            }
        }
    }
    return count
}

//优化, 使用两次遍历 使用set, 来优化
func numJewelsInStones2(_ J: String, _ S: String) -> Int {
    let setJ = Set(J)
    return S.reduce(0) { (result, char) -> Int in
        if setJ.contains(char){
            return result + 1
        }else{
            return result
        }
    }
}
