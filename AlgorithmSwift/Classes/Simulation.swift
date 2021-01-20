//
//  Simulation.swift
//  AlgorithmSwift
//
//  Created by ios on 2021/1/20.
//  Copyright © 2021 ios. All rights reserved.
//

import UIKit

/*
 模拟算法

 模拟就是用计算机来模拟题目中要求的操作。

 模拟题目通常具有码量大、操作多、思路繁复的特点。由于它码量大，经常会出现难以查错的情况，如果在考试中写错是相当浪费时间的。
 */
class Simulation: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(simulation(n: 20, u: 2, d: 1))
    }


    /*
     一只一英寸的蠕虫位于 n 英寸深的井的底部。它每分钟向上爬 u 英寸，但是必须休息一分钟才能再次向上爬。在休息的时候，它滑落了 d 英寸。之后它将重复向上爬和休息的过程。蠕虫爬出井口花费了多长时间？我们将不足一分钟的部分算作一整分钟。如果蠕虫爬完后刚好到达井的顶部，我们也设作蠕虫已经爬出井口。
     */

    func simulation(n: Int, u: Int, d: Int) -> Int {
        var time = 0, height = 0
        while true {
            height += u
            time += 1
            if height >= n {
                break
            }

            height -= d
            time += 1
        }
        return time
    }
}
