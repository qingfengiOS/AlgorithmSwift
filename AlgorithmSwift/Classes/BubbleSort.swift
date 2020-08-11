//
//  BubbleSort.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/8/5.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

class BubbleSort: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func sort() {
        let count = orgArray.count
        for i in 0..<count {
            for j in stride(from: count - 2, to: i - 1, by: -1) {
                if orgArray[j] > orgArray[j+1] {
                    orgArray.swapAt(j, j+1)
                }
            }
            print(orgArray)
        }
    }
}
