//
//  BOJ_17609.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/27.
// BOJ 17609 - 회문 : 그리디
import Foundation

func secondCheck(s: [String], left: Int, right: Int) -> Bool {
  var left = left
  var right = right
  while left < right {
    if s[left] == s[right] {
      left += 1
      right -= 1
    }
    else {
      return false
    }
  }
  return true
}

func firstCheck(s: [String], left: Int, right: Int) -> Int {
  var left = left
  var right = right
  while left < right {
    if s[left] == s[right] {
      left += 1
      right -= 1
    }
    else {
      var check1 = secondCheck(s: s, left: left+1, right: right)
      var check2 = secondCheck(s: s, left: left, right: right-1)
      
      if check1 || check2 {
        return 1
      }
      else {
        return 2
      }
    }
  }
  return 0
}

let n = Int(readLine()!)!

for _ in 0..<n {
  let s = Array(readLine()!).map {String($0)}
  let left = 0
  let right = s.count-1
  let answer = firstCheck(s: s, left: left, right: right)
  print(answer)
}

