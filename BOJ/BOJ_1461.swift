//
//  BOJ_1461.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/28.
// BOJ 1461 - 도서관 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
let nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var left: [Int] = [] // 음수
var right: [Int] = [] // 양수
var result = 0

for num in nums {
  if num >= 0 {
    right.append(num)
  }
  else {
    left.append(num)
  }
}

var distance: [Int] = []
left.sort()
for i in 0..<Int(left.count/m) {
  distance.append(left[m*i] * -1)
}
if left.count % m > 0 {
  distance.append(left[Int(left.count/m)*m] * -1)
}

right.sort(by: >)
for i in 0..<Int(right.count/m) {
  distance.append(right[m*i])
}
if right.count % m > 0 {
  distance.append(right[Int(right.count/m)*m])
}
distance.sort()
result = distance.popLast()!
result += 2*distance.reduce(0, +)
print(result)

