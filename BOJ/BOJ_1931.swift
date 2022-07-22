//
//  BOJ_1931.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/22.
// BOJ 1931 - 회의실 배정 : 그리디
import Foundation
let n = Int(readLine()!)!
var list: [(Int, Int)] = []
var count = 0
var endTime = -1

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int($0)!}
  list.append((input[0], input[1]))
}

list.sort { (a: (Int, Int), b: (Int, Int)) -> Bool in
  // 회의실 끝나는 시간이 같은 경우
  if a.1 == b.1 {
    return a.0 < b.0
  }
  
  // 같지 않으면 끝나는 시간 기준으로 정렬
  else {
    return a.1 < b.1
  }
}

for i in list {
  // 이 회의실이 끝난 시간 뒤에 있는 회의면 추가
  if i.0 >= endTime {
    endTime = i.1
    count += 1
  }
}

print(count)
