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
 
 */


//角标变化情况是
/*
0    6       12     18
1  5 7    11 13   17
2 4  8 10    14 16
3    9       15
*/

//注意到 下标刚好是 2*numRows-2 作为一个周期. 所以只要知道 index % (2*numRows-2) 到对应数组的通项公式即可.

func convert(_ s: String, _ numRows: Int) -> String {
    
    if s.count <= 2 || numRows <= 1{
        return s
    }
    
    var strArr : [String] = Array(repeating: "", count: numRows)
    for (index, char) in s.enumerated(){
        let index2 = index % (numRows*2 - 2)
        print("index2 = \(index2)")
        if(index2 < numRows){
            strArr[index2].append(char)
            print(strArr[index2])
        }else{
            strArr[(numRows*2 - 2) - index2].append(char)
        }
    }
    var result = ""
    strArr.forEach {result += $0}
    return result
}

convert("LEETCODEISHIRING",4)
"LDREOEIIECIHNTSG"

convert("LEETCODEISHIRING",3)
"LCIRETOESIIGEDHN"

convert("A",1)

