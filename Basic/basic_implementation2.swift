//
//  basic_implementation2.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/04.
//

import Foundation

// 구현 - 시각
// 시간을 입력받고 시간 안에 3이 들어간 횟수 구하기
let n = Int(readLine()!)!
var count = 0

for hour in 0...n {
  for i in 0..<60 {
    for j in 0..<60 {
      let times = String(hour) + String(i) + String(j)
      if times.contains("3") {
        count += 1
      }
    }
  }
}

print(count)

