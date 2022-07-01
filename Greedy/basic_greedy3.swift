//
//  main.swift
//  Algorithm
//
//  Created by 임영선 on 2022/06/28.
//

import Foundation
// 곱하기 혹은 더하기
// 각 자리의 숫자 사이에 * 또는 + 연산을 수행하여 가장 큰 수 만들기
let nums = Array(readLine()!).map {Int(String($0))!}
var result = nums[0]

for i in 0..<nums.count {
  let num = nums[i]
  if num<=1 || result<=1 {
    result += num
  }
  else {
    result *= num
  }
}

print(result)
