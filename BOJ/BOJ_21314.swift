//
//  BOJ_21314.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/23.
// BOJ 21314 - 민겸수 : 그리디
import Foundation
let input = Array(readLine()!).map {String($0)}
var mCount = 0
var min = ""
var max = ""
for i in input {
  if i == "K" {
    if mCount == 0 {
      min += "5"
      max += "5"
    }
    else {
      min += "1" + String(repeating: "0", count: mCount-1) + "5"
      max += "5" + String(repeating: "0", count: mCount)
    }
    mCount = 0
  }
  else {
    mCount += 1
  }
}

// m으로 끝나는 경우
if mCount>0 {
  max += String(repeating: "1", count: mCount)
  min += "1" + String(repeating: "0", count: mCount-1)
}

print(max)
print(min)

