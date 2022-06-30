//
//  coin.swift
//  Algorithm
//
//  Created by 임영선 on 2022/06/30.
//

import Foundation

// 거스름돈 화폐의 최소 개수
var input = Int(readLine()!)!
let array = [500, 100, 50, 10]
var count: Int = 0

for coin in array {
  count += Int(input / coin)
  input %= coin
}

print(count)
