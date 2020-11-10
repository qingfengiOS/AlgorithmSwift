//
//  MaxLengthCharacters_1624.swift
//  AlgorithmSwift
//
//  Created by liyiping on 2020/11/10.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给你一个字符串 s，请你返回 两个相同字符之间的最长子字符串的长度 ，计算长度时不含这两个字符。如果不存在这样的子字符串，返回 -1 。

 子字符串 是字符串中的一个连续字符序列。

 示例 1：

 输入：s = "aa"
 输出：0
 解释：最优的子字符串是两个 'a' 之间的空子字符串。
 示例 2：

 输入：s = "abca"
 输出：2
 解释：最优的子字符串是 "bc" 。
 */
class MaxLengthCharacters_1624: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(maxLengthBetweenEqualCharacters("cabbac"))
        print(maxLengthBetweenEqualCharacters("aa"))
        print(maxLengthBetweenEqualCharacters("cbzxy"))
    }
    
    /*
     常规字典计数比较型问题，注意边界条件及题目需求返回值（没有返回-1，只有两个字符返回0）
     */
    func maxLengthBetweenEqualCharacters(_ s: String) -> Int {
        guard s.count > 2 else {
            return 0
        }
        var num = -1
        var recordDic = [String: Int]()
        for (index, ch) in s.enumerated() {
            if let alreadyIndex = recordDic["\(ch)"] {
                num = max(num, index - alreadyIndex - 1)
            } else {
                recordDic["\(ch)"] = index
            }
        }
        return num
    }
}
