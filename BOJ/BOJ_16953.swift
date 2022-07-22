//
//  BOJ_16953.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/23.
// BOJ 16953 - A -> B : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int($0)!}
var a = input[0]
var b = input[1]
var count = 0

while a < b {
  // b의 끝이 1이면
  if b%10 == 1 {
    b = Int(b/10)
    count += 1
  }
  // b가 짝수이면
  else if b%2 == 0 {
    b /= 2
    count += 1
  }
  else {
    break
  }
}

if a == b {
  print(count+1)
}
else {
  print("-1")
}
