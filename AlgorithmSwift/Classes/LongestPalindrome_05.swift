//
//  LongestPalindrome_05.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/11/25.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个字符串 s，找到 s 中最长的回文子串。你可以假设 s 的最大长度为 1000。
 
 示例 1：

 输入: "babad"
 输出: "bab"
 注意: "aba" 也是一个有效答案。
 示例 2：

 输入: "cbbd"
 输出: "bb"

 动态规划问题；
 */
class LongestPalindrome_05: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print(longestPalindrome("babad"))
        print(longestPalindrome2("babad"))
    }

    func longestPalindrome(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        let strArray = Array(s)
        var maxLength = 1 //最长回文串的长度
        var begin = 0 // 起始位置
        
        var record = [[Bool]](repeating: [Bool](repeating: false, count: strArray.count), count: strArray.count) //二位数据记录结果
        for i in (0..<strArray.count).reversed() {
            for j in i..<strArray.count {
                let length = j - i + 1
                record[i][j] = (strArray[i] == strArray[j]) && (length <= 2 || record[i + 1][j - 1])//外层是否为回文 == 两端相同且中间为回文，（如果length <= 2必定为回文）
                
                if record[i][j] && length > maxLength {
                    maxLength = length
                    begin = i
                }
            }
        }
        return String(strArray[begin..<begin + maxLength])
    }
    
    func longestPalindrome2(_ s: String) -> String {
        guard s.count > 1 else {
            return s
        }
        
        var maxLength = 1 //最长回文串的长度
        var begin = 0 // 起始位置
        let unicodeScalars = s.unicodeScalars.map{ $0.value }
        
        var record = [[Bool]](repeating: [Bool](repeating: false, count: s.count), count: s.count) //二位数据记录结果
        for i in (0..<unicodeScalars.count).reversed() {
            for j in i..<s.count {
                let length = j - i + 1
                record[i][j] = (unicodeScalars[i] == unicodeScalars[j]) && (length <= 2 || record[i + 1][j - 1])//外层是否为回文 == 两端相同且中间为回文，（如果length <= 2必定为回文）
                
                if record[i][j] && length > maxLength {
                    maxLength = length
                    begin = i
                }
            }
        }
        let start = s.index(s.startIndex, offsetBy: begin)
        let end = s.index(s.startIndex, offsetBy: begin + maxLength)
        return String(s[start..<end])
    }
}
