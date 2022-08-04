//
//  BOJ_2885.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/04.
// BOJ 2885 - 초콜릿 식사 : 그리디
import Foundation
var k = Int(readLine()!)!
var size = 1
var count = 0
while k > size {
  size *= 2
}

var size2 = size
while k > 0 {
  if k >= size2 {
    k -= size2
  }
  else {
    size2 /= 2
    count += 1
  }
}
print(size, count)


