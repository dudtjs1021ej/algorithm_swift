//
//  BOJ_13413.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/01.
// BOJ 13413 - 오셀로 재배치 : 그리디
import Foundation
var t = Int(readLine()!)!
for _ in 0..<t {
  let n = Int(readLine()!)!
  let a = Array(readLine()!).map {String($0)}
  let b = Array(readLine()!).map {String($0)}
  var answer = 0.0
  var aCheck: [String] = []
  var bCheck: [String] = []
  
  // a,b 서로 다른 값을 각각 배열에 넣음
  for i in 0..<n {
    if a[i] != b[i] {
      aCheck.append(a[i])
      bCheck.append(b[i])
    }
  }
  // 정렬
  aCheck.sort()
  bCheck.sort()
  
  for i in 0..<aCheck.count {
    // 같은 경우 2개의 위치를 바꿈
    if aCheck[i] == bCheck[i] {
      answer += 0.5
    }
    // 다른 경우 1개의 색상을 바꿈
    else {
      answer += 1
    }
  }
  print(Int(answer))
}

