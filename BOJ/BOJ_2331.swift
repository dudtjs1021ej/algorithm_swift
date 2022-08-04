//
//  BOJ_2331.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/05.
// BOJ 2331 - 반복수열 : 탐색
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
var (a, p) = (input[0], input[1])
var nums: [Int] = [a]
var index = 0

// 각자리의 합을 배열에 넣고 배열에 그 값이 있으면 break
while true {
  var num = 0
  let temp = Array(String(nums.last!)).map {Int(String($0))!}
  for i in temp {
    var t = 1
    for _ in 0..<p {
      t *= i
    }
    num += t
  }
  
  if nums.contains(num) {
    index = nums.firstIndex(of: num)!
    break
  }
  nums.append(num)
}
print(index)
