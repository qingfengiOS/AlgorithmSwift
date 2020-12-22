//
//  LetterCombinations_17.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/12/22.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个仅包含数字 2-9 的字符串，返回所有它能表示的字母组合。

 给出数字到字母的映射如下（与电话按键相同）。注意 1 不对应任何字母。
 */
class LetterCombinations_17: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(letterCombinations("23"))
    }

    var result = [String]()
    let record: [Character: [String]] = [
        "1": [""],
        "2": ["a", "b", "c"],
        "3": ["d", "e", "f"],
        "4": ["g", "h", ""],
        "5": ["j", "k", "l"],
        "6": ["m", "n", "o"],
        "7": ["p", "q", "r", "s"],
        "8": ["t", "u", "v"],
        "9": ["w", "x", "y", "z"]
    ]

    func letterCombinations(_ digits: String) -> [String] {
        guard digits.count > 0 else {
            return []
        }

        iterStr(s: "", dig: Array(digits), index: 0)
        return result
    }

    func iterStr(s: String, dig: [Character], index: Int) {
        if index == dig.count { //用index记录每次遍历到字符串的位置
            result.append(s)
            return
        }
        //获取index位置的字符，假设输入的字符是"234"
        //第一次递归时index为0所以c=2，第二次index为1所以c=3，第三次c=4
        //subString每次都会生成新的字符串，而index则是取当前的一个字符，所以效率更高一点
        let char = dig[index]

        let letters = record[char]!

        //遍历字符串，比如第一次得到的是2，也就是遍历"abc"
        for i in 0..<letters.count {
            iterStr(s: s + letters[i], dig: dig, index: index + 1)
        }
    }

}
