//
//  BOJ_1080.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/02.
// BOJ 1080 - 행렬 : 그리디
import Foundation

func reverseThree(_ i: Int, _ j: Int) {
  for i in i..<i+3 {
    for j in j..<j+3 {
      if a[i][j] == 0 {
        a[i][j] = 1
      }
      else {
        a[i][j] = 0
      }
    }
  }
}

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var a: [[Int]] = []
var b: [[Int]] = []
var count: Int = 0

for _ in 0..<n {
  a.append(Array(readLine()!).map{Int(String($0))!})
}
for _ in 0..<n {
  b.append(Array(readLine()!).map{Int(String($0))!})
}

let row = n-2<0 ? 0 : n-2
let column = m-2<0 ? 0 : m-2
for i in 0..<row {
  for j in 0..<column {
    if a[i][j] != b[i][j] {
      reverseThree(i, j)
      count += 1
    }
  }
  if a == b {
    break
  }
}

if a == b {
  print(count)
}
else {
  print("-1")
}

