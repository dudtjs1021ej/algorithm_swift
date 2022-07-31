//
//  BOJ_1449.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/31.
// BOJ 1449 - 수리공 항승 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let l = input[1]
var locations = readLine()!.split(separator: " ").map {Double(String($0))!}

locations.sort() // 위치 정렬
var start = locations[0]
var end = locations[0]+Double(l)
var count = 1

// 시작지점은 해당 위치, 끝지점은 해당 위치 + 테이프길이 -> 그 사이에 있는 위치는 같은 테이프 붙일 수 있음
for i in 1..<n {
  if start <= locations[i] && locations[i] < end {
    continue
  }
  else {
    count += 1
    start = locations[i]
    end = locations[i]+Double(l)
  }
}

print(count)

