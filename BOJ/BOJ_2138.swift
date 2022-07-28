//
//  BOJ_2138.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/28.
// BOJ 2138 - 전구와 스위치 : 그리디
import Foundation

// 전구 상태를 바꿈
func switchButton(num: Int) -> Int {
  if num == 0 {
    return 1
  }
  else {
    return 0
  }
}

// 첫번째 전구를 누르는 경우
func zeroClick(state: [Int]) -> Int {
  var state = state
  var count = 1
  state[0] = switchButton(num: state[0])
  state[1] = switchButton(num: state[1])
  for i in 1..<n {
    if state[i-1] != result[i-1] {
      count += 1
      state[i-1] = switchButton(num: state[i-1])
      state[i] = switchButton(num: state[i])
      if i != n-1 {
        state[i+1] = switchButton(num: state[i+1])
      }
    }
    if state == result {
      return count
    }
  }
  return -1
}

// 첫번째 전구를 안누르는 경우
func zeroNoClick(state: [Int]) -> Int {
  var state = state
  var count = 0
  for i in 1..<n {
    // i-1번째 전구가 결과값이랑 다르면 스위치 누름
    if state[i-1] != result[i-1] {
      count += 1
      state[i-1] = switchButton(num: state[i-1])
      state[i] = switchButton(num: state[i])
      if i != n-1 {
        state[i+1] = switchButton(num: state[i+1])
      }
    }
    if state == result {
      return count
    }
  }
  return -1
}

let n = Int(readLine()!)!
var state = Array(readLine()!).map {Int(String($0))!}
var result = Array(readLine()!).map {Int(String($0))!}
let result1 = zeroClick(state: state)
let result2 = zeroNoClick(state: state)

if result1>=0 && result2>=0 {
  print(min(result1, result2))
}
else if result1>=0 && result2<0 {
  print(result1)
}
else if result2>=0 && result1<0 {
  print(result2)
}


