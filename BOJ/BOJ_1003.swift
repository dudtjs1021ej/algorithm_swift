//
//  BOJ_1003.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/31.
//  BOJ 1003 - 피보나치 함수 : DP
import Foundation
let t = Int(readLine()!)!
var zeroCount = [1,0,1]
var oneCount = [0,1,1]
for _ in 0..<t {
  let n = Int(readLine()!)!
  fiboCount(n)
  print(zeroCount[n], oneCount[n])
}

func fiboCount(_ n: Int) {
  if n >= zeroCount.count {
    for i in zeroCount.count...n {
      zeroCount.append(zeroCount[i-2]+zeroCount[i-1])
      oneCount.append(oneCount[i-2]+oneCount[i-1])
    }
  }
}
