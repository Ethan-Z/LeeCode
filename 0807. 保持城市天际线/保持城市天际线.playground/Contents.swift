import UIKit
/*
 在二维数组grid中，grid[i][j]代表位于某处的建筑物的高度。 我们被允许增加任何数量（不同建筑物的数量可能不同）的建筑物的高度。 高度 0 也被认为是建筑物。
 
 最后，从新数组的所有四个方向（即顶部，底部，左侧和右侧）观看的“天际线”必须与原始数组的天际线相同。 城市的天际线是从远处观看时，由所有建筑物形成的矩形的外部轮廓。 请看下面的例子。
 
 建筑物高度可以增加的最大总和是多少？
 
 例子：
 输入： grid = [[3,0,8,4],[2,4,5,7],[9,2,6,3],[0,3,1,0]]
 输出： 35
 解释：
 The grid is:
 [ [3, 0, 8, 4],
 [2, 4, 5, 7],
 [9, 2, 6, 3],
 [0, 3, 1, 0] ]
 
 从数组竖直方向（即顶部，底部）看“天际线”是：[9, 4, 8, 7]
 从水平水平方向（即左侧，右侧）看“天际线”是：[8, 7, 9, 3]
 
 在不影响天际线的情况下对建筑物进行增高后，新数组如下：
 
 gridNew = [ [8, 4, 8, 7],
 [7, 4, 7, 7],
 [9, 4, 8, 7],
 [3, 3, 3, 3] ]

 */

func maxIncreaseKeepingSkyline(_ grid: [[Int]]) -> Int {
    
    let columnsMaxArr = grid.map{ $0.max()!}
    let flatMapArr = grid.flatMap{$0}
    let orginHeight = flatMapArr.reduce(0, +)
    var rowMaxArr = [Int]()
    //获取列最高数组
    for (i, _) in grid.enumerated() {
        var columnsArr = [Int]()
        for (index, value) in flatMapArr.enumerated() where index % grid.count == i  {
            columnsArr.append(value)
        }
        rowMaxArr.append(columnsArr.max()!)
    }
    var nowHeight = 0
    for  column in columnsMaxArr{
        for  row in rowMaxArr{
            nowHeight += column < row ? column : row
           

        }
    }
    return nowHeight - orginHeight
}




// 更优解法

func maxIncreaseKeepingSkyline2(_ grid: [[Int]]) -> Int {
    
    if grid.count <= 1 {
        return 0
    }
    
    let count = grid.count
    var hHeight:[Int] = Array(repeating: 0 , count: count)
    var vHeight:[Int] = Array(repeating: 0 , count: count)
    
    
    for hIdx in 0..<count{
        for vIdx in 0..<count {
            hHeight[hIdx] = max(hHeight[hIdx] , grid[hIdx][vIdx])
            vHeight[vIdx] = max(vHeight[vIdx] , grid[hIdx][vIdx])
        }
    }

    var gridOffsetCount:Int = 0
    var maxGrid : Int = 0
    var height : Int = 0
    for vIdx in 0..<count{
        for hIdx in 0..<count {
            maxGrid = min(vHeight[vIdx] , hHeight[hIdx])
            height = grid[hIdx][vIdx]
            if maxGrid > height{
                gridOffsetCount += maxGrid - height
            }
            
        }
    }
    
    return gridOffsetCount
    
}

let gridNew = [[59,88,44],[3,18,38],[21,26,51]]


let startTime = CFAbsoluteTimeGetCurrent()

maxIncreaseKeepingSkyline2(gridNew)

let endTime = CFAbsoluteTimeGetCurrent()

print("执行时间 \(endTime - startTime)")
