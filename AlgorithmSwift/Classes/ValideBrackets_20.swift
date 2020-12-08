//
//  ValideBrackets_20.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/12/8.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。

 有效字符串需满足：

 左括号必须用相同类型的右括号闭合。
 左括号必须以正确的顺序闭合。
 注意空字符串可被认为是有效字符串。
 */
class ValideBrackets_20: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(isValid("(]"))
        print(isValid("([)]"))
        print(isValid("()[]{}"))
    }
    
    /*
     FIFO思想遍历判断
     */
    func isValid(_ s: String) -> Bool {
        guard s.count > 0 else {
            return true
        }
        guard s.count % 2 == 0 else {
            return false
        }
        
        var recordArray = [Character]()
        
        for ch in s {
            switch ch {
            case "(", "[", "{":
                recordArray.append(ch)
            case ")":
                if recordArray.popLast() != "(" {
                    return false
                }
            case "]":
                if recordArray.popLast() != "[" {
                    return false
                }
            case "}":
                if recordArray.popLast() != "{" {
                    return false
                }
            default:
                break
            }
        }
        return recordArray.isEmpty
    }
}
