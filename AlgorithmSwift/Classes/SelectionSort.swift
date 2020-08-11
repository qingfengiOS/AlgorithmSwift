//
//  SelectionSort.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/8/10.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class SelectionSort: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    /*
    从选择排序的过程来看，它最大的特点就是交换移动数据次数相当少，节约了相应的时间。分析它的时间复杂度发现，无论最好最差情况，其比较次数是一样多的 n-1 + n-2 + ... + 1 = n(n-1)/2。而对于交换次数而言，最好的时候交换为0次，最差的时候，为n-1次，基于最终的排序时间是比较与交换的次数总和，因此，总的时间复杂度为O(n²)

    尽管与冒泡排序同为O(n²)，但选择排序的性能上还是要略优于冒泡排序。
    */

    override func sort() {
        for i in 0..<orgArray.count {
            var minIndex = i
            for j in i+1..<orgArray.count {
                if orgArray[minIndex] > orgArray[j] {//如果有比当前最小值还小的就把该值设为最小值
                    minIndex = j
                }
            }
            if i != minIndex {
                orgArray.swapAt(i, minIndex)
            }
            print(orgArray)
        }
    }
}
