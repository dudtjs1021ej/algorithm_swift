//
//  BOJ_13019.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/31.
// BOJ 13019 - A를 B로 : 그리디
import Foundation
var a = Array(readLine()!).map {String($0)}
let b = Array(readLine()!).map {String($0)}
var count: Int = 0
var curr: Int = b.count-1

// 문자열 뒤에서부터 다른 개수 셈
if a.sorted() != b.sorted() {
  print("-1")
}
else {
  for i in stride(from: a.count-1, through: 0, by: -1) {
    if a[i] != b[curr] {
      count += 1
    }
    else {
      curr -= 1
    }
  }
  print(count)
}

