//
//  longestCommonPrefix_14.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/9/27.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*


 */
class LongestCommonPrefix_14: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(longestCommonPrefix(["flow", "flower", "flight"]))")
        print("\(longestCommonPrefix(["acv", "afc", "sw"]))")
    }

    func longestCommonPrefix(_ strs: [String]) -> String {
        guard let firstStr = strs.first else { //非空判断
            return ""
        }

        var result = ""

        if strs.count > 1 {
            let sortedStrs = strs.sorted() //排序原素组
            let first = sortedStrs.first! //第一个字符串
            let last = sortedStrs.last! //最后一个字符串

            let lastArray = Array(last)
            for (index, firstChar) in first.enumerated() {// 遍历第一个字符串
                if lastArray[index] != firstChar { //判断和最后一个字符串对应位置是否相同，不同就直接返回了
                    return result
                }
                result += String(firstChar)
            }
        } else { //只有一个元素直接返回
            result = firstStr
        }

        return result
    }
}
