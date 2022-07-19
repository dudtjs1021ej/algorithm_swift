//
//  BOJ_20115.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/19.
// BOJ 20115 - 에너지 드링크 : 그리디
import Foundation
let n = Int(readLine()!)!
var result = 0.0

var drink = readLine()!.split(separator: " ").map {Double(String($0))!}.sorted()

// 오름차순 정렬하고 가장 양이 많은 음료수를 제외하고 나누기 2해서 더함
for i in 0..<n-1 {
  result += drink[i]/2
}
result += drink[n-1]

print(result)
