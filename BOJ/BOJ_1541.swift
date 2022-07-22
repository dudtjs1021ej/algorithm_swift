//
//  BOJ_1541.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/23.
// BOJ 1541 - 잃어버린 괄호 : 그리디
import Foundation
var answer = 0
var temp = 0
// - 기준으로 나눔(뒤에 모두 -로 계산 가능)
var input = readLine()!.split(separator: "-")

// + 기준으로 나눔 (무조건 다 +로 계산)
var plus = input[0].split(separator: "+").map {Int($0)!}

for p in plus {
  answer += p
}

for i in 1..<input.count {
  let minus = input[i].split(separator: "+").map {Int($0)!}
  for m in minus {
    temp += m
  }
}

print(answer-temp)
