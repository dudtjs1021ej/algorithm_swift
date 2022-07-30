//
//  BOJ_12931.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/30.
// BOJ 12931 - 두 배 더하기 : 그리디
import Foundation
let n = Int(readLine()!)!
var nums = readLine()!.split(separator: " ").map {Int(String($0))!}
var count = 0

// B에서 모두 0으로 바꿈 (반대로 계산)
while !nums.allSatisfy({$0==0}) {
  // 모든 값이 2로 나눠지면 나눔
  if nums.allSatisfy({$0 % 2 == 0}) {
    count += 1
    nums = nums.map {$0/2}
  }
  else {
    // 2로 나눠지지 않는 값 -1
    for i in 0..<n {
      if nums[i] % 2 != 0 {
        count += 1
        nums[i] -= 1
      }
    }
  }
}
print(count)

