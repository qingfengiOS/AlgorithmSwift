//
//  QuickSort.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/8/11.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class QuickSort: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        sort(left: 0, right: orgArray.count - 2)
        print(orgArray)
    }

    func sort(left: Int, right: Int) {
        if left >= right {
            return
        }
        var i = left
        var j = right
        let povit = orgArray[i]
        while i < j {
            while orgArray[j] >= povit && i < j  {//右边的比key大，再向左移，继续找
                j -= 1
            }
            orgArray[i] = orgArray[j]//找右边到了比key小的数，交换位置，将最小值调换到i的位置

            while orgArray[i] <= povit && i < j {//右边找到了比标准key小的数，就从i开始找左边比key大的
                i += 1
            }
            orgArray[j] = orgArray[i]

            orgArray[i] = povit//将标准数key放到正确位置
        }
        sort(left: left, right: i - 1)
        sort(left: i + 1, right: right)
    }
}
