//
//  intersect_350.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/9/27.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class Intersect_350: BaseViewController {
    override func viewDidLoad() {
        super.viewDidLoad()

        print("\(intersect([1, 3, 4, 4, 14], [1, 4, 9, 10]))")
        print("\(intersect2([1, 3, 4, 4, 14], [1, 4, 9, 10]))")
    }

    /*
    给定两个数组，编写一个函数来计算它们的交集。
    */
    func intersect(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var result = [Int]()
        guard !nums1.isEmpty && !nums2.isEmpty else {
            return result
        }
        var recordNum1Dic = [Int: Int]() //key:  元素 value： 出现次数

        for num in nums1 {
            if let appearCount = recordNum1Dic[num], appearCount != 0 {
                recordNum1Dic[num] = appearCount + 1
            } else {
                recordNum1Dic[num] = 1
            }
        }

        for num in nums2 {
            if let appearCount = recordNum1Dic[num], appearCount > 0 {
                recordNum1Dic[num] = appearCount - 1
                result.append(num)
            }
        }
        return result
    }


    /*
     给定两个数组，编写一个函数来计算它们的交集。

     已经排序的情况下优化算法
    */
    func intersect2(_ nums1: [Int], _ nums2: [Int]) -> [Int] {
        var res = [Int]()
        guard !nums1.isEmpty && !nums2.isEmpty else { return res }

        var i = 0, j = 0

        while i < nums1.count && j < nums2.count {
            if nums1[i] > nums2[j] {
                j += 1
            } else if nums1[i] < nums2[j] {
                i += 1
            } else {
                res.append(nums1[i])
                i += 1
                j += 1
            }
        }
        return res
    }
}
