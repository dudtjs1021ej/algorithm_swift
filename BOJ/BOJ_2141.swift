//
//  BOJ_2141.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/25.
// BOJ 2141 - 우체국 : 그리디
import Foundation
let n = Int(readLine()!)!
var infos: [[Int]] = []
var people = 0

// 인구의 절반이 속한 마을에 우체국을 설치하는 것이 효율적
for _ in 0..<n {
  let input = readLine()!.split(separator: " ").map {Int($0)!}
  infos.append(input)
  people += input[1]
}
// 마을 위치 순으로 정렬
infos = infos.sorted(by: {$0[0] < $1[0]})

// 전체 인구의 절반
var mid = Int(people/2)

// 전체 인구가 홀수일 경우 올림
if people%2 == 1 {
  mid += 1
}
var count = 0
for info in infos {
  count += info[1]
  if count >= mid {
    print(info[0])
    break
  }
}

