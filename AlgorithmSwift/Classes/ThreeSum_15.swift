//
//  ThreeSum_15.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/12/9.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit
/*
 给你一个包含 n 个整数的数组 nums，判断 nums 中是否存在三个元素 a，b，c ，使得 a + b + c = 0 ？请你找出所有满足条件且不重复的三元组。

 注意：答案中不可以包含重复的三元组。

 示例：

 给定数组 nums = [-1, 0, 1, 2, -1, -4]，

 满足要求的三元组集合为：
 [
   [-1, 0, 1],
   [-1, -1, 2]
 ]
 */
class ThreeSum_15: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(threeSum([-2,-3,0,0,-2]))
    }
    
    func threeSum(_ nums: [Int]) -> [[Int]] {
        guard nums.count >= 3 else {
            return []
        }
        
        let sortedNums = nums.sorted()
        var targetArray = [[Int]]()
        if sortedNums[0] > 0 { //排序后最小数都 >0 直接结束
            return []
        }
        
        for i in 0..<sortedNums.count - 2 {
            if i > 0 && sortedNums[i] == sortedNums[i - 1] {//前两个数不相同
                continue
            }
            
            var left = i + 1
            var right = sortedNums.count - 1
            while left < right {
                let res = sortedNums[i] + sortedNums[left] + sortedNums[right]
                if res == 0 {
                    targetArray.append([sortedNums[i], sortedNums[left], sortedNums[right]])
                    repeat {
                        left += 1
                    } while left < right && sortedNums[left] == sortedNums[left - 1] //后两个数不能相同
                    
                    repeat {
                        right -= 1
                    } while left < right && sortedNums[right + 1] == sortedNums[right]
                } else if res > 0 {
                    repeat {
                        right -= 1
                    } while left < right && sortedNums[right + 1] == sortedNums[right]
                } else {
                    repeat {
                        left += 1
                    } while left < right && sortedNums[left] == sortedNums[left - 1]
                }
            }
        }
        return targetArray
    }
}
