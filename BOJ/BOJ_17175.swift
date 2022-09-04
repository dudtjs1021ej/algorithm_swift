//
//  BOJ_17175.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/05.
//  BOJ 17175 - 피보나치는 지겨웡 : DP
import Foundation

let n = Int(readLine()!)!
var nums = [1,1]

if n < 2 {
  print(nums[n])
}

else {
  for _ in 0..<n-1 {
    nums.append(nums[nums.count-1]+nums[nums.count-2]+1)
  }
  print(nums[nums.count-1] % 1000000007)
}
