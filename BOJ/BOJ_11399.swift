//
//  BOJ_11399.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/19.
// BOJ 11399 - ATM : 그리디
import Foundation
let n = Int(readLine()!)!
var time = readLine()!.split(separator: " ").map {Int($0)!}
time.sort()
var sum = 0
var temp = 0
for i in 0..<n {
  temp += time[i]
  sum += temp
}
print(sum)
