//
//  IsPalindrome_9.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/12/15.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 判断一个整数是否是回文数。回文数是指正序（从左向右）和倒序（从右向左）读都是一样的整数。

 示例 1:

 输入: 121
 输出: true
 示例 2:

 输入: -121
 输出: false
 解释: 从左向右读, 为 -121 。 从右向左读, 为 121- 。因此它不是一个回文数。
 */

class IsPalindrome_9: BaseViewController {

    /*
     经典双指针问题
     */
    override func viewDidLoad() {
        super.viewDidLoad()
        print(isPalindrome2(121))
    }

    func isPalindrome(_ x: Int) -> Bool {
        guard x > 0 else {
            return false
        }
        var strX = String(x)
        while strX.count > 1 {
            guard strX.removeFirst() == strX.popLast() else {
                return false
            }
        }
        return true
    }


    func isPalindrome2(_ x: Int) -> Bool {
        guard x >= 0 else {
            return false
        }
        let strX = String(x)
        let xArr = Array(strX)

        var i = 0, j = xArr.count - 1

        while i < j {
            if xArr[i] == xArr[j] {
                i += 1
                j -= 1
            } else {
                return false
            }
        }
        return true
    }

}
