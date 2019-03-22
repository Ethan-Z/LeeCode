import UIKit


/*
 将两个有序链表合并为一个新的有序链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。
 
 示例：
 
 输入：1->2->4, 1->3->4
 输出：1->1->2->3->4->4
 

 */

class ListNode {
    var val: Int
    var next: ListNode?
    
    init(_ val: Int) {
        self.val = val
        self.next = nil
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


func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
    
    guard let g1 = l1 else {
        return l2
    }
    guard let g2 = l2 else {
        return l1
    }

    let start = min(g1.val, g2.val)
    let startNode = ListNode(start)
    var preNode : ListNode? = startNode
    var node1 = start == g1.val ? g1.next : g1
    var node2 = (start == g2.val && g1.val != g2.val ) ? g2.next : g2

    while  node1 != nil || node2 != nil {
        print("node1 value is \(node1?.val ?? 0)")
        print("node2 value is \(node2?.val ?? 0)")
        if node1 == nil {
            preNode?.next = node2
            break
        }
        if node2 == nil {
            preNode?.next = node1
            break
        }
        if node1!.val  < node2!.val {
            preNode?.next = ListNode(node1!.val)
            node1 = node1?.next
            preNode = preNode?.next
        }else {
            preNode?.next = ListNode(node2!.val)
            node2 = node2?.next
            preNode = preNode?.next
        }
    }

    return startNode
}

let node1 = nodeFormArr([1,2,4])
let node2 =  nodeFormArr([1,3,4])
let node3 = mergeTwoLists(node1, node2)

getNum(node3, mul: 1)
