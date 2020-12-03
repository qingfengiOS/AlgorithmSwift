//
//  RemoveElement_27.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/12/3.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给你一个数组 nums 和一个值 val，你需要 原地 移除所有数值等于 val 的元素，并返回移除后数组的新长度。

 不要使用额外的数组空间，你必须仅使用 O(1) 额外空间并 原地 修改输入数组。

 元素的顺序可以改变。你不需要考虑数组中超出新长度后面的元素。

  

 示例 1:

 给定 nums = [3,2,2,3], val = 3,

 函数应该返回新的长度 2, 并且 nums 中的前两个元素均为 2。

 你不需要考虑数组中超出新长度后面的元素。
 示例 2:

 给定 nums = [0,1,2,2,3,0,4,2], val = 2,

 函数应该返回新的长度 5, 并且 nums 中的前五个元素为 0, 1, 3, 0, 4。

 注意这五个元素可为任意顺序。

 你不需要考虑数组中超出新长度后面的元素。
 */

class RemoveElement_27: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

//        var nums = [3, 2, 2, 3]
//        print(removeElement(&nums, 3))
        
        var nums2 = [0, 1, 2, 2, 3, 0, 4, 2]
        print(removeElement(&nums2, 2))
    }
    
    /*
     经典快慢指针问题
     */
    func removeElement(_ nums: inout [Int], _ val: Int) -> Int {
        var i = 0 //慢指针
        for j in 0..<nums.count {
            if nums[j] != val { //快指针符合，记录并且移动慢指针
                nums[i] = nums[j]
                i += 1
            }
        }
        return i
    }
}
