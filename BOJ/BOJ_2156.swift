//
//  BOJ_2156.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/01.
//  BOJ 2156 - 포도주 시식 : DP
import Foundation

let n = Int(String(readLine()!))!
var arr:[Int] = []
var dp = Array(repeating: 0, count: 10001)
arr.append(0)
for _ in 0..<n {
    arr.append(Int(String(readLine()!))!)
}

dp[1] = arr[1]
if n >= 2 {
    dp[2] = arr[1] + arr[2]
}

for i in stride(from: 3, through: n, by: 1) {
    dp[i] = max(dp[i - 2] + arr[i], dp[i - 3] + arr[i] + arr[i - 1], dp[i - 1])
}

print(dp[n])
