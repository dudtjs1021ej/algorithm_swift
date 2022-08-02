//
//  BOJ_2012.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/02.
// BOJ 2012 - 등수 매기기 : 그리디
import Foundation
let n = Int(readLine()!)!
var ranks: [Int] = []
var answer: Int = 0

for _ in 0..<n {
  ranks.append(Int(readLine()!)!)
}
ranks.sort() // 등수 정렬

// 1 1 2 3 5 5
// 1 2 3 4 5 6 등수 부여하고 차이 계산
for i in 0..<n {
  answer += abs((i+1) - ranks[i])
}

print(answer)

