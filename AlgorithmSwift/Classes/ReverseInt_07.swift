//
//  ReverseInt_07.swift
//  AlgorithmSwift
//
//  Created by 李一平 on 2020/11/23.
//  Copyright © 2020 ios. All rights reserved.
//

import UIKit

/*
 给出一个 32 位的有符号整数，你需要将这个整数中每位上的数字进行反转。

 示例 1:

 输入: 123
 输出: 321
  示例 2:

 输入: -123
 输出: -321
 
 注意:

 假设我们的环境只能存储得下 32 位的有符号整数，则其数值范围为 [−2^31,  2^31 − 1]。请根据这个假设，如果反转后整数溢出那么就返回 0。
 */
class ReverseInt_07: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        print(reverse(1534236469))
    }
    
    /*
     32位数的范围是
     */
    func reverse(_ x: Int) -> Int {
        var res: Int = 0
        var temp: Int = x
        while temp != 0 {
            let pop: Int = temp % 10
            if res > Int32.max / 10 || (res == Int32.max / 10 && pop > 7) { //2^31尾数是7
                return 0
            }
            if res < Int32.min / 10 || (res == Int32.min / 10 && pop < -8)  {// -2^31尾数是-8
                return 0
            }
            
            res = res * 10 + pop //核心算法，求余、乘10、加尾数
            temp /= 10
        }
        return res
    }
}
