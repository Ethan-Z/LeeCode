import UIKit


/*
 将一个给定字符串根据给定的行数，以从上往下、从左到右进行 Z 字形排列。
 
 比如输入字符串为 "LEETCODEISHIRING" 行数为 3 时，排列如下：
 
 L   C   I   R
 E T O E S I I G
 E   D   H   N
 
 之后，你的输出需要从左往右逐行读取，产生出一个新的字符串，比如："LCIRETOESIIGEDHN"。
 
 请你实现这个将字符串进行指定行数变换的函数：
 
 string convert(string s, int numRows);
 
 示例 1:
 
 输入: s = "LEETCODEISHIRING", numRows = 3
 输出: "LCIRETOESIIGEDHN"
 
 示例 2:
 
 输入: s = "LEETCODEISHIRING", numRows = 4
 输出: "LDREOEIIECIHNTSG"
 解释:
 
 L     D     R
 E   O E   I I
 E C   I H   N
 T     S     G
 
-2
0    6       12     18
1  5 7    11 13   17
2 4  8 10    14 16
3    9       15
 
 */


func convert(_ s: String, _ numRows: Int) -> String {
    
    var charArr : [[Character]] = []
    for _ in 0..<numRows{
        charArr.append([])
    }
    for (index, char) in s.enumerated(){
        
        let index2 = index % (numRows + numRows - 2)
        print("index2 = \(index2)")
        if(index2 < numRows){
            charArr[index2].append(char)
            print(charArr[index2])
        }else{
            charArr[index2 - numRows].append(char)
        }
    }
    
    
    var result = ""
    for i in 0..<numRows{
        print(charArr[i])
        result = result + String(charArr[i])
    }

    return result
}


convert("LEETCODEISHIRING",4)
