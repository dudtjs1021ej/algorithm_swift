//
//  BOJ_13164.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/23.
// BOJ 13164 - 행복 유치원 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int($0)!}
let n = input[0]
let k = input[1]
let heights = readLine()!.split(separator: " ").map {Int($0)!}
var costs: [Int] = [] // 학생들의 키 차이들

for i in 0..<n-1 {
  costs.append(heights[i+1]-heights[i])
}

costs.sort()
print(costs[0..<n-k].reduce(0,+))
