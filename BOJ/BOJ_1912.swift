//
//  BOJ_1912.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/26.
//  BOJ 1912 - 연속합 - DP
import Foundation
let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map {Int(String($0))!}
var sum = [a[0]]
for i in 0..<n-1 {
  sum.append(max(sum[i]+a[i+1], a[i+1]))
}
print(sum.max()!)

