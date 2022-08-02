//
//  BOJ_14247.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/03.
// BOJ 14247 - 나무 자르기 : 그리디
import Foundation
let n = Int(readLine()!)!
let h = readLine()!.split(separator: " ").map {Int(String($0))!}
let a = readLine()!.split(separator: " ").map {Int(String($0))!}
var answer: Int = 0

var heightInfo: [(Int, Int)] = []
for i in 0..<n {
  heightInfo.append((h[i], a[i]))
}
heightInfo.sort(by: {$0.1 < $1.1})

// 성장 속도가 제일 더딘 나무부터 자름
for i in 0..<n {
  answer += heightInfo[i].0 + (heightInfo[i].1 * i)
}
print(answer)

