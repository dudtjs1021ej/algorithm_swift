//
//  BOJ_14400.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/29.
// BOJ 14400 - 편의점2 : 그리디
import Foundation
let input = Array(readLine()!).map {String($0)}
var n = Int(input[0])!
var locations: [(Int, Int)] = []
for _ in 0..<n {
  let location = readLine()!.split(separator: " ").map {Int(String($0))!}
  locations.append((location[0], location[1]))
}

// 편의점 중간거리 구하기
// x, y좌표 정렬하고 정렬기준으로 x, y 가운데값에 세움
let midX = locations.sorted(by: {$0.0 < $1.0})[Int(n/2)].0
let midY = locations.sorted(by: {$0.1 < $1.1})[Int(n/2)].1

var sum = 0
for location in locations {
  sum += abs(midX-location.0) + abs(midY-location.1)
}
print(sum)

