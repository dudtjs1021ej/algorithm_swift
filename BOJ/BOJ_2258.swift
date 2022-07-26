//
//  BOJ_2258.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/27.
// BOJ 2258 - 정육점 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]
let m = input[1]
var meats: [(Int, Int)] = []

for _ in 0..<n {
  let meat = readLine()!.split(separator: " ").map {Int(String($0))!}
  meats.append((meat[0], meat[1]))
}
// 가격 기준으로 오름차순 정렬, 가격이 같다면 가격기준 내림차순으로 정렬(더 싼걸 먼저 사게)
meats = meats.sorted(by: {$0.1 == $1.1 ? $0.0 > $1.0 : $0.1 < $1.1})

var beforeCost = 0 // 전 가격이랑 같은지 비교
var match = 0
var sum = 0
var answer = Int.max

for i in 0..<n {
  sum += meats[i].0
  // 전과 가격이 다른 경우
  if beforeCost != meats[i].1 {
    if sum >= m {
      answer = min(answer, meats[i].1)
    }
    beforeCost = meats[i].1
    match = 1
  }
  // 전과 가격이 같은 경우
  else {
    if sum >= m {
      answer = min(answer, meats[i].1 + beforeCost*match)
    }
    match += 1
  }
}

print(answer == Int.max ? -1 : answer)
