import UIKit

/*
 给定 n 个非负整数 a1，a2，...，an，每个数代表坐标中的一个点 (i, ai) 。在坐标内画 n 条垂直线，垂直线 i 的两个端点分别为 (i, ai) 和 (i, 0)。找出其中的两条线，使得它们与 x 轴共同构成的容器可以容纳最多的水。
 
 说明：你不能倾斜容器，且 n 的值至少为 2。
 
 图中垂直线代表输入数组 [1,8,6,2,5,4,8,3,7]。在此情况下，容器能够容纳水（表示为蓝色部分）的最大值为 49。
 */


//简单实现, 但是数组元素太多时, 会超时
func maxArea(_ height: [Int]) -> Int {
    var areaArr = [Int]()
    for (index, value) in height.enumerated(){
        for (index2, value2) in height.dropFirst(index).enumerated() where index2 != 0{
            areaArr.append(min(value, value2) * index2 )
        }
    }
    return areaArr.max()!
}


// 面积  S  = (x2 - x1) * min(h1, h2)


//  S2 =  ((x2 -1) - x1) * min (h1, h(x2-1))  //右边移动一位

//  S3 = (x2 - (x + 1))) * min (h(x+1), h2)  // 左边移动一位

// 如果说 h1 < h2  那么肯定有  S > S3  也就是说 如果左边比右边低,  那么不管右边向左移动多少位,面积肯定是越来越小的
//同理有:
//如果说 h1 > h2  那么肯定有  S > S2


func maxArea2(_ height: [Int]) -> Int {
    var maxArea =  0
    var right = 0
    var left = height.count - 1
    while right < left {
        let long =  left - right
        maxArea =  max(maxArea, min(height[left], height[right]) * long)
        if height[left] < height[right]{
            left -= 1
        }else{
            right += 1
        }
    }
    return maxArea
}

maxArea2([1,8,6,2,5,4,8,3,7])
