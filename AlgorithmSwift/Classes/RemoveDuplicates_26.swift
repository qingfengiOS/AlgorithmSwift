//
//  RemoveDuplicates_26.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/11/30.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个排序数组，你需要在 原地 删除重复出现的元素，使得每个元素只出现一次，返回移除后数组的新长度。

 不要使用额外的数组空间，你必须在 原地 修改输入数组 并在使用 O(1) 额外空间的条件下完成。

 示例 1:

 给定数组 nums = [1,1,2],

 函数应该返回新的长度 2, 并且原数组 nums 的前两个元素被修改为 1, 2。
 
 示例 2:

 给定 nums = [0,0,1,1,1,2,2,3,3,4],

 函数应该返回新的长度 5, 并且原数组 nums 的前五个元素被修改为 0, 1, 2, 3, 4。

 你不需要考虑数组中超出新长度后面的元素
 */
class RemoveDuplicates_26: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var nums = [1,1]
        var nums2 = [0,0,1,1,1,2,2,3,3,4]
        print(removeDuplicates(&nums))
        print(removeDuplicates(&nums2))
        
    }
    

    /*
    快慢指针问题，一次遍历搞定
    */
    func removeDuplicates(_ nums: inout [Int]) -> Int {
        guard nums.count > 1 else {
            return nums.count
        }
        
        var i = 0 //慢指针，相等才移动
        
        for j in 0..<nums.count {//快指针，一直移动
            if nums[i] != nums[j] {
                i += 1
                nums[i] = nums[j]
            }
        }
        return i + 1
    }
}
