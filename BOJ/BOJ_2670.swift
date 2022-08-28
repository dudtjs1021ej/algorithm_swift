//
//  BOJ_2670.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/28.
//  BOJ 2670 - 연속부분최대곱 : DP
import Foundation
let n = Int(readLine()!)!
var nums: [Double] = []
for _ in 0..<n {
  nums.append(Double(readLine()!)!)
}
var mul = [nums[0]]
for i in 0..<n-1 {
  mul.append(max(mul[i]*nums[i+1], nums[i+1]))
}
print(String(format: "%.3f", mul.max()!))
