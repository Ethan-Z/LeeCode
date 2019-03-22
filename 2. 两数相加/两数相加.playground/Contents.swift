import UIKit


/*
 给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
 
 如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
 
 您可以假设除了数字 0 之外，这两个数都不会以 0 开头。
 
 示例：
 
 输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
 输出：7 -> 0 -> 8
 原因：342 + 465 = 807
 
 */


class ListNode {
    var val: Int
    var next: ListNode?

    init(_ val: Int) {
        self.val = val
        self.next = nil
    }
}


func nodeform(_ num: Int) -> ListNode?{
    
    let startNode  = ListNode(num % 10)
    var preNode = startNode
    var value = num / 10
    while value > 0 {
        let unit = value % 10
        let node =  ListNode(unit)
        preNode.next =  node
        preNode = node
        value = value / 10
    }
    
    return startNode
}

func getNum(_ node: ListNode?,mul: Int) -> Int{
    
//    print(mul)
    if let node = node {
        if let subNode = node.next{
            return node.val*mul + getNum(subNode, mul: 10*mul)
        }else{
            return node.val * mul
        }
    }else{
        return 0
    }
}

func nodeFormArr(_ arr: [Int]) -> ListNode{
    
    let startNode = ListNode(arr.first!)
    var preNode =  startNode
    for value in arr.dropFirst() {
        let node = ListNode(value)
        preNode.next = node
        preNode = node
    }
    return startNode
}


// 方法1:  将Node转换成数字, 得到和值, 将和转换成Node, 这种方式虽然可用, 但是一旦节点很长, 这时Int就存储不了那么大的数字,从而出现奔溃
func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode? ) -> ListNode? {
    
    let sum = getNum(l1,mul: 1) + getNum(l2,mul: 1)
    return nodeform(sum)
}



// 方法1: 直接使用node 相加, 要注意的是 进位的处理
func addTwoNumbers2(_ l1: ListNode?, _ l2: ListNode? ) -> ListNode? {
    
    guard let l1 = l1 else {
        return l2
    }
    
    guard let l2 = l2 else {
        return l1
    }
    
    let startNode = ListNode((l1.val + l2.val) % 10)
    var preNode : ListNode = startNode
    var nextNode : ListNode? = nil
    var node1 = l1.next
    var node2 = l2.next
    var isCarry = (l1.val + l2.val) / 10
    
    while node1 != nil || node2 != nil {
        let sum =  (node1?.val ?? 0) + (node2?.val ?? 0) + isCarry
        nextNode = ListNode(sum % 10)
        preNode.next = nextNode
        preNode = nextNode!
        node1 = node1?.next
        node2 = node2?.next
        isCarry = sum / 10
    }
    
    if isCarry == 1{
        preNode.next = ListNode(isCarry)
    }
    
    return startNode
}

let node2 = nodeFormArr([5,3,5])
//let node2 = nodeFormArr([2,4,3])
//getNum(node2, mul: 1)
let node5 = nodeFormArr([2,1,5])
getNum(node5, mul: 1)

let addNode = addTwoNumbers2(node2, node5)

getNum(addNode, mul: 1)

