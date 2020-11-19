//
//  LengthOfLongestSubstring_03.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/11/19.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个字符串，请你找出其中不含有重复字符的 最长子串 的长度。

 示例 1:

 输入: "abcabcbb"
 输出: 3
 解释: 因为无重复字符的最长子串是 "abc"，所以其长度为 3。

 输入: "pwwkew"
 输出: 3
 解释: 因为无重复字符的最长子串是 "wke"，所以其长度为 3。
      请注意，你的答案必须是 子串 的长度，"pwke" 是一个子序列，不是子串。
 */
class LengthOfLongestSubstring_03: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(lengthOfLongestSubstring("pwwkew"))
        print(lengthOfLongestSubstring2("pwwkew"))
    }

    /*
     滑动窗口 + 记录法
     */
    func lengthOfLongestSubstring(_ s: String) -> Int {
        guard s.count > 0 else {
            return 0
        }
        
        var leftIndex = 0
        var maxLength = 0
        
        var recordDic = [Character: Int]()
        
        for (index ,char) in s.enumerated() {
            if let recordIndex = recordDic[char], recordIndex >= leftIndex {
                leftIndex = recordIndex + 1
            }
            maxLength = max(maxLength, index - leftIndex + 1)
            recordDic[char] = index
        }
        return maxLength
    }
    
    
    func lengthOfLongestSubstring2(_ s: String) -> Int {
        if s == "" {
            return 0
        }
        var maxStr = String()
        var noRepeatStr = String()
        for char in s {
            while noRepeatStr.contains(char) {
                noRepeatStr.remove(at: noRepeatStr.startIndex)
            }
            noRepeatStr.append(char)
            maxStr = noRepeatStr.count > maxStr.count ? noRepeatStr : maxStr
        }
        return maxStr.count
    }
}
