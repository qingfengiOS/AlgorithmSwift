//
//  MaxProfit_121ViewController.swift
//  AlgorithmSwift
//
//  Created by ios on 2020/10/20.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 121. 买卖股票的最佳时机
 题目：

 给定一个数组，它的第 i 个元素是一支给定股票第 i 天的价格。

 如果你最多只允许完成一笔交易（即买入和卖出一支股票一次），设计一个算法来计算你所能获取的最大利润。

 注意： 你不能在买入股票前卖出股票。
 */

class MaxProfit_121: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(maxProfit([7, 1, 5, 3, 6, 4]))
        print(maxProfit2([7, 1, 5, 3, 6, 4]))
    }
    
    func maxProfit(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }

        var minPrice = Int.max
        var minIndex = 0
        var maxProfit = 0

        for (index, price) in prices.enumerated() {
            if price < minPrice {
                minPrice = price
                minIndex = index
            }

            minPrice = min(price, minPrice)
            maxProfit = max(price - minPrice, maxProfit)
        }

        for index in minIndex..<prices.count {
            maxProfit = prices[index] - minPrice > maxProfit ? prices[index] - minPrice : maxProfit
        }

        return maxProfit
    }

    //优化，只用一次遍历，不要记录最小下标
    func maxProfit2(_ prices: [Int]) -> Int {
        if prices.isEmpty {
            return 0
        }

        var minPrice = Int.max
        var maxProfit = 0

        for price in prices {
            minPrice = min(price, minPrice)
            maxProfit = max(price - minPrice, maxProfit)
        }
        return maxProfit
    }
}
