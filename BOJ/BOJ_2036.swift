//
//  BOJ_2036.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/28.
// BOJ 2036 - 수열의 점수 : 그리디
import Foundation

var n = Int(readLine()!)!
var negative: [Int] = [] // 음수
var positive: [Int] = [] // 양수
var one: [Int] = [] // 1
var score = 0

for _ in 0..<n {
  let input = Int(readLine()!)!
  if input > 1 {
    positive.append(input)
  }
  else if input <= 0 {
    negative.append(input)
  }
  else {
    one.append(input)
  }
}
positive.sort(by: >)
negative.sort()

// 양수
if positive.count % 2 == 0{
  for i in stride(from: 0, through: positive.count-1, by: 2) {
    score += positive[i] * positive[i+1]
  }
}
else {
  for i in stride(from: 0, through: positive.count-2, by: 2) {
    score += positive[i] * positive[i+1]
  }
  score += positive[positive.count-1]
}

// 음수
if negative.count % 2 == 0{
  for i in stride(from: 0, through: negative.count-1, by: 2) {
    score += negative[i] * negative[i+1]
  }
}
else {
  for i in stride(from: 0, through: negative.count-2, by: 2) {
    score += negative[i] * negative[i+1]
  }
  score += negative[negative.count-1]
}

score += one.reduce(0, +)

print(score)





