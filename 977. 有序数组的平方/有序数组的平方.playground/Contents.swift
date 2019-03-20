import UIKit


func sortedSquares(_ A: [Int]) -> [Int] {
    
    return A.map{ $0 * $0 }.sorted()
    
}


sortedSquares([-4,-1,0,3,10])
