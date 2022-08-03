//
//  BOJ_12018.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/03.
// BOJ 12018 - Yonsei TOTO : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var miles: [Int] = []

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int(String($0))!}
  let p = input[0]; let l = input[1]
  let arr = readLine()!.split(separator: " ").map {Int(String($0))!}.sorted(by: >)
  if p < l {
    miles.append(1)
  }
  else {
    miles.append(arr[l-1])
  }
}

miles.sort()

var sum = 0
var count = 0
for mile in miles {
  sum += mile
  if sum > m {
    break
  }
  count += 1
}

print(count)


