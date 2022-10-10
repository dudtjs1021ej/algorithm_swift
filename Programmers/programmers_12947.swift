//
//  programmers_12947.swift
//  Algorithm
//
//  Created by 임영선 on 2022/10/10.
//  Programmers 12947 - 하샤드 수 : 구현

import Foundation

func solution(_ x:Int) -> Bool {
  var sum = String(x).map {Int(String($0))!}.reduce(0) {$0 + $1}
  print(sum)
  if x % sum == 0 {
    return true
  }
  else {
    return false
  }
}

