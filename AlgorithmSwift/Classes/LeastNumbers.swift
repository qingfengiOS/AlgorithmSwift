//
//  LeastNumbers.swift
//  AlgorithmSwift
//
//  Created by Aiden on 2020/11/16.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 剑指 Offer 40. 最小的k个数
 输入整 数数组 arr ，找出其中最小的 k 个数。例如，输入4、5、1、6、2、7、3、8这8个数字，则最小的4个数字是1、2、3、4。
 示例:

 输入：arr = [3,2,1], k = 2
 输出：[1,2] 或者 [2,1]
 */
class LeastNumbers: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(getLeastNumbers([2, 1, 3], 2))
    }
    
    func getLeastNumbers(_ arr: [Int], _ k: Int) -> [Int] {
        guard k > 0 && !arr.isEmpty else {
            return []
        }
        var arr2 = arr
        search(&arr2, 0, arr.count - 1, k)
        return Array(arr2[0...k-1])
    }
    
    func search(_ arr: inout [Int], _ low: Int, _ high: Int, _ k: Int) {
        let res = sort(&arr, low, high)
        if res == k - 1 {
            return
        } else if res > k - 1 {
            search(&arr, low, res - 1, k)
        } else {
            search(&arr, res + 1, high, k)
        }
    }
    
    func sort(_ arr: inout [Int], _ left: Int, _ right: Int) -> Int {
        var i = left
        var j = right
        let povit = arr[i]
        while i < j {
            while arr[j] >= povit && i < j  {//右边的比key大，再向左移，继续找
                j -= 1
            }
            arr[i] = arr[j]//找右边到了比key小的数，交换位置，将最小值调换到i的位置

            while arr[i] <= povit && i < j {//右边找到了比标准key小的数，就从i开始找左边比key大的
                i += 1
            }
            arr[j] = arr[i]

            arr[i] = povit//将标准数key放到正确位置
        }
        return i
    }
}
