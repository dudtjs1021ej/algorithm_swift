//
//  BOJ_16162.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/02.
// BOJ 16162 - 가희와 3단 고음 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let a = input[1]; let d = input[2]
let sound = readLine()!.split(separator: " ").map {Int(String($0))!}
var x: Int = 0
var curr: Int = 0
for i in 0..<n {
  if sound[i] == a + x*d {
    x += 1
  }
}
print(x)

