//
//  toSum_1.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/9/27.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个整数数组 nums 和一个目标值 target，请你在该数组中找出和为目标值的那 两个 整数，并返回他们的数组下标。

 你可以假设每种输入只会对应一个答案。但是，数组中同一个元素不能使用两遍。
 */
class ToSum_1: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(twoSum([2, 7, 11, 15],  18))

    }
    

    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        guard nums.count > 1 else {
            return [Int]()
        }
        var recordDic = [Int: Int]()
        for (index, num) in nums.enumerated() {
            recordDic[num] = index
        }

        for (index, num) in nums.enumerated() {
            let targetNum = target - num
            if  let tempIndex = recordDic[targetNum], tempIndex != index {
                return [index, tempIndex]
            }
        }
        return [Int]()
    }

}
