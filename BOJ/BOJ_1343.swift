//
//  BOJ_1343.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/16.
// BOJ 1343 - 폴리오미노 : 그리디
var count = 0
var input = Array(readLine()!)
var i = 0
while i<input.count {
  if i <= input.count-4 && input[i..<i+4] == ["X","X","X","X"] {
    input[i..<i+4] = ["A","A","A","A"]
    i += 4
  }
  else if i != input.count-1 && input[i...i+1] == ["X","X"] {
    input[i...i+1] = ["B","B"]
    i += 2
  }
  else if input[i] == "." {
    i += 1
  }
  else {
    break
  }
}
if input.contains("X") {
  print("-1")
}
else {
  for i in input {
    print(i, terminator: "")
  }
}


// 숏코딩
import Foundation

var poly = readLine()!

poly = poly.replacingOccurrences(of: "XXXX", with: "AAAA")
poly = poly.replacingOccurrences(of: "XX", with: "BB")

print(poly.contains("X") ? "-1" : poly)
