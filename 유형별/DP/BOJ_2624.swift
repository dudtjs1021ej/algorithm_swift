//
//  BOJ_2624.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/19.
//

// https://www.acmicpc.net/problem/2624
// BOJ 2624 - DP: 동전 바꿔주기, 골드5

import Foundation

let T = Int(readLine()!)!
let k = Int(readLine()!)!

var coins: [(value: Int, count: Int)] = []
var dp = Array(repeating: 0, count: T+1)
dp[0] = 1

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let value = input[0]; let count = input[1]
    coins.append((value, count))
}

for coin in coins {
    for money in stride(from: T, through: 0, by: -1) {
        for i in 1...coin.count {
            if money-coin.value*i >= 0 {
                dp[money] += dp[money-coin.value*i]
            }
        }
    }
}

print(dp[T])

