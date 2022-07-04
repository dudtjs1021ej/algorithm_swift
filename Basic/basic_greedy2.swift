//
//  main.swift
//  Algorithm
//
//  Created by 임영선 on 2022/06/28.
//

import Foundation

// 1이 될때까지 1을빼거나 k로 나눔
var input = readLine()!.split(separator: " ").map { Int($0)! }
var n = input[0]
let k = input[1]
var count = 0

while true {
  if n < k {
    break
  }
  
  // 1빼기 한번에 진행
  let target = (Int(n/k))*k
  count += n - target
  n = target

  n /= k
  count += 1
  
  print(n, count)
}

print(count)

