//
//  BOJ_12904.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/27.
// BOJ 12904 - A와 B : 그리디
import Foundation

let s = Array(readLine()!).map {String($0)}
var t = Array(readLine()!).map {String($0)}

while !t.isEmpty {
  if t == s {
    break
  }
  if t[t.count-1] == "A" {
    t.removeLast()
  }
  else {
    t.removeLast()
    t = t.reversed()
  }
}

if t == s {
  print("1")
}
else {
  print("0")
}

