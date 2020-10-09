//
//  BinarySearch.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/8/11.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class BinarySearch: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(bSearch(array: [1, 3, 14, 33, 56, 77, 78, 99], value: 56) ?? "找不到")
        print(bSearch2(array: [1, 3, 14, 33, 33, 33, 78, 99], value: 33) ?? "找不到")
        print(bSearch3(array: [1, 3, 14, 33, 33, 33, 78, 99], value: 33) ?? "找不到")
    }

    //常规二分查找
    func bSearch(array: [Int], value: Int) -> Int? {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let middle = low + (high - low) >> 1
            if value > array[middle] {
                low = middle + 1
            } else if value < array[middle] {
                high = middle - 1
            } else {
                return middle
            }
        }
        return nil
    }

    /**
     变体一：查找第一个值等于给定值的元素上一节中的二分查找是最简单的一种，即有序数据集合中不存在重复的数据，我们在其中查找值等于某个给定值的数据。如果我们将这个问题稍微修改下，有序数据集合中存在重复的数据，我们希望找到第一个值等于给定值的数据，这样之前的二分查找代码还能继续工作吗？
     */
    func bSearch2(array: [Int], value: Int) -> Int? {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let middle = low + (high - low) >> 1
            if value > array[middle] {
                low = middle + 1
            } else if value < array[middle] {
                high = middle - 1
            } else {
                if middle == 0 || array[middle - 1] != value {
                    return middle
                } else {
                    high = middle - 1
                }
            }
        }
        return nil
    }
    // a[mid]跟要查找的 value 的大小关系有三种情况：大于、小于、等于。对于 a[mid]>value 的情况，我们需要更新 high= mid-1；对于 a[mid]<value 的情况，我们需要更新 low=mid+1。这两点都很好理解。那当 a[mid]=value 的时候应该如何处理呢？

   // 如果我们查找的是任意一个值等于给定值的元素，当a[mid]等于要查找的值时，a[mid]就是我们要找的元素。但是，如果我们求解的是第一个值等于给定值的元素，当 a[mid]等于要查找的值时，我们就需要确认一下这个 a[mid]是不是第一个值等于给定值的元素。

    // 我们重点看第 50~53 行代码。如果 mid 等于 0，那这个元素已经是数组的第一个元素，那它肯定是我们要找的；如果mid 不等于 0，但 a[mid]的前一个元素 a[mid-1]不等于 value，那也说明 a[mid]就是我们要找的第一个值等于给定值的元素。如果经过检查之后发现 a[mid]前面的一个元素 a[mid-1]也等于 value，那说明此时的 a[mid]肯定不是我们要查找的第一个值等于给定值的元素。那我们就更新 high=mid-1，因为要找的元素肯定出现在[low, mid-1]之间。


    /*
     变体二：寻找数组中最后一个等于目标数的下标
    */
    func bSearch3(array: [Int], value: Int) -> Int? {
        var low = 0
        var high = array.count - 1
        while low <= high {
            let middle = low + (high - low) >> 1
            if value < array[middle] {
                high = middle - 1
            } else if value > array[middle] {
                low = middle + 1
            } else {
                if middle == 0 || array[middle + 1] != value {
                    return middle
                } else {
                    low = middle + 1
                }
            }
        }
        return nil
    }
}

