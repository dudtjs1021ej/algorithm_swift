//
//  BOJ_1439.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/25.
// BOJ 1439 - 뒤집기 : 그리디
import Foundation

var input = Array(readLine()!).map {String($0)}
var zeroCount = 0
var oneCount = 0

if input[0] == "0" {
  zeroCount += 1
}
else {
  oneCount += 1
}

for i in 0..<input.count-1 {
  if input[i] != input[i+1] {
    if input[i+1] == "0" {
      zeroCount += 1
    }
    else {
      oneCount += 1
    }
  }
}

print(min(zeroCount, oneCount))
