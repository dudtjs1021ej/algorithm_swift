//
//  BOJ_16922.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/25.
//  BOJ 16922 - 로마숫자 만들기
import Foundation
let n = Int(readLine()!)!
var result = [Int]()

if n == 0 {
  print(0)
}
else {
  for i in 0...n {
    for j in 0...n-i {
      for k in 0...n-i-j {
        let temp = n-i-j-k
        let number = i + j*5 + k*10 + temp*50
        result.append(number)
      }
    }
  }
}
print(Set(result).count) // set -> 중복제거
