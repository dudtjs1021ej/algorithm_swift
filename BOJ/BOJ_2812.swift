//
//  BOJ_2812.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/25.
// BOJ 2812 - 크게 만들기 : 그리디
import Foundation
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]
let k = input[1]
var count = k
let nums = Array(readLine()!).map {Int(String($0))!}
var stack: [Int] = []

// 스택에 넣어 스택에 들어있는 값보다 작으면 다 pop하고 push
for num in nums {
  while !stack.isEmpty && count > 0{
    if stack[stack.count-1] < num {
      stack.removeLast()
      count -= 1
    }
    else {
      break
    }
  }
  stack.append(num)
}
for i in 0..<n-k {
  print(stack[i], terminator: "")
}
