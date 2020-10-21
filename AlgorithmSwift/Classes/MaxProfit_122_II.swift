//
//  MaxProfit_122_II.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/10/21.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 设计一个算法来计算你所能获取的最大利润。你可以尽可能地完成更多的交易（多次买卖一支股票）。

 注意：你不能同时参与多笔交易（你必须在再次购买前出售掉之前的股票）。
 */
class MaxProfit_122_II: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(maxProfit([7, 1, 5, 3, 6, 4]))
        print(maxProfit([1, 2, 3, 4, 5]))
        print(maxProfit([7, 6, 4, 3, 1]))
    }


    /*
     可以多次买卖，最大利润就是所有上升波段全部吃到；
     使用当天价格减去前一天价格，>0 则记一次利润，遍历结束即可得到所有利润
     */
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }

        var maxProfit = 0
        var prePrice = prices[0]
        for index in 1..<prices.count {
            if prices[index] - prePrice > 0 {
                maxProfit += prices[index] - prePrice
            }
            prePrice = prices[index]
        }
        return maxProfit
    }
}
