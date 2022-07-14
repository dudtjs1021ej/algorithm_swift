//
//  BOJ_14467.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/14.
// BOJ 14467 - 소가 길을 건너간 이유 1 : 구현
let n = Int(readLine()!)!
var cows = [Int](repeating: -1, count: 11)
var count = 0

for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int($0)!}
  // 지금 소의 상태와 다르면
  if cows[input[0]] != -1 && cows[input[0]] != input[1] {
    count += 1
  }
  cows[input[0]] = input[1]
}

print(count)
