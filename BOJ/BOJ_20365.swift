//
//  BOJ_20365.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/23.
// BOJ 20365 - 블로그2 : 그리디
import Foundation
let n = Int(readLine()!)!
let colors = Array(readLine()!).map {String($0)}
var currentColor = colors[0]
var redCount = 0
var blueCount = 0

for i in 1..<colors.count {
  if currentColor != colors[i] {
    if currentColor == "R" {
      redCount += 1
    }
    else {
      blueCount += 1
    }
    currentColor = colors[i]
  }
  
  // 마지막 인덱스이면
  if i == colors.count-1 {
    if colors[i] == "R" {
      redCount += 1
    }
    else {
      blueCount += 1
    }
  }
}
blueCount>redCount ? print(redCount+1) : print(blueCount+1)
