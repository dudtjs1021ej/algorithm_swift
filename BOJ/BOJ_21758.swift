//
//  BOJ_21758.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/23.
// BOJ 21758 - 꿀따기 : 그리디
import Foundation
let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int($0)!}
var honeyMax = 0
let sum = nums.reduce(0, +)
var temp = nums[0]

//벌 - 벌 - 꿀  (꿀통 맨 오른쪽 고정, 벌 한마리 왼쪽 고정)
for i in 1..<n {
 temp += nums[i] // 선택된 벌
  honeyMax = max(honeyMax, (sum - nums[0])+(sum - temp - nums[i]))
}

// 꿀 - 벌 - 벌
nums.reverse()
temp = nums[0]
for i in 1..<n {
 temp += nums[i] // 선택된 벌
  honeyMax = max(honeyMax, (sum - nums[0])+(sum - temp - nums[i]))
}

// 벌 - 꿀 - 벌
for i in 1..<n {
  honeyMax = max(honeyMax, sum - nums[0] - nums[n-1] + nums[i])
}

print(honeyMax)
