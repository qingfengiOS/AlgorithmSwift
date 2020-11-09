//
//  RotateArray_189.swift
//  AlgorithmSwift
//
//  Created by liyiping on 2020/11/9.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个数组，将数组中的元素向右移动 k 个位置，其中 k 是非负数。

 示例 1:

 输入: [1,2,3,4,5,6,7] 和 k = 3
 输出: [5,6,7,1,2,3,4]
 解释:
 向右旋转 1 步: [7,1,2,3,4,5,6]
 向右旋转 2 步: [6,7,1,2,3,4,5]
 向右旋转 3 步: [5,6,7,1,2,3,4]
 示例 2:

 输入: [-1,-100,3,99] 和 k = 2
 输出: [3,99,-1,-100]
 解释:
 向右旋转 1 步: [99,-1,-100,3]
 向右旋转 2 步: [3,99,-1,-100]

 来源：力扣（LeetCode）
 链接：https://leetcode-cn.com/problems/rotate-array
 著作权归领扣网络所有。商业转载请联系官方授权，非商业转载请注明出处。
 
 */
class RotateArray_189: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var array = [1, 2, 3, 4, 5, 6, 7]
//        rotate(&array, 3)
//        print(array)
        
        rotateByReverse(&array, 3)
        print(array)
    }
    
    /*
    使用Sift的subRange处理
     */
    func rotate(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty && k > 0 else {
            return
        }
        
        let offset = k % nums.count
        let start = nums.count - offset
        let end = nums.count - 1

        guard start <= end else { return }
        
        let range = start...end
        
        let subNums = nums[range]
        
        nums.removeSubrange(range)
        nums.insert(contentsOf: subNums, at: 0)
    }
    
    /*
     多次反转法
     step1: 反转整个数组
     step2: 反转前面K个
     step2: 反转后面nums.count - K个
     */
    func rotateByReverse(_ nums: inout [Int], _ k: Int) {
        guard !nums.isEmpty && k > 0 else {
            return
        }

        let offset = k % nums.count //偏移量

        reverse(&nums, 0, nums.count - 1)
        reverse(&nums, 0, offset - 1)
        reverse(&nums, offset, nums.count - 1)
        
    }
    
    func reverse(_ nums: inout [Int], _ left: Int, _ right: Int) {
        var start = left
        var end = right
        
        var temp = 0
        while start < end {
            temp = nums[start]
            nums[start] = nums[end]
            nums[end] = temp
            start += 1
            end -= 1
        }
    }
}
