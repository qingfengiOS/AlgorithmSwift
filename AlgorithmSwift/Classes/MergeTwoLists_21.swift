//
//  MergeTwoLists_21.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/12/28.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class MergeTwoLists_21: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let o3 = ListNode.init(4)
        let o2 = ListNode.init(2, o3)
        let o1 = ListNode.init(1, o2)

        let t3 = ListNode.init(4)
        let t2 = ListNode.init(3, t3)
        let t1 = ListNode.init(1, t2)

        var res = mergeTwoLists2(o1, t1)

        while res?.next != nil {
            print(res?.val ?? "-")
            res = res?.next
        }
    }

    /*
     如果 l1 或者 l2 一开始就是空链表 ，那么没有任何操作需要合并，所以我们只需要返回非空链表。否则，我们要判断 l1 和 l2 哪一个链表的头节点的值更小，然后递归地决定下一个添加到结果里的节点。如果两个链表有一个为空，递归结束。
     */
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let one = l1 else {
            return l2
        }
        guard let two = l2 else {
            return l1
        }

        if one.val < two.val {
            one.next = mergeTwoLists2(one.next, two)
            return one
        } else {
            two.next = mergeTwoLists2(two.next, one)
            return two
        }
    }

    func mergeTwoLists2(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var one = l1
        var two = l2
        var pre: ListNode?

        let preHead = ListNode()
        pre = preHead

        while one != nil && two != nil {
            if one!.val <= two!.val {
                pre?.next = one
                one = one?.next
            } else {
                pre?.next = two
                two = two?.next
            }
            pre = pre?.next
        }
        pre?.next = one ?? two
        return preHead.next
    }
}


 // Definition for singly-linked list.
 public class ListNode {
     public var val: Int
     public var next: ListNode?
     public init() {
        self.val = 0
        self.next = nil
     }

     public init(_ val: Int) {
        self.val = val
        self.next = nil
     }

     public init(_ val: Int, _ next: ListNode?) {
        self.val = val
        self.next = next
     }
 }

