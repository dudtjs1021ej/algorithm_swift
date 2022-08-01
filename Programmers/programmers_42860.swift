//
//  programmers_42860.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/01.
// BOJ 42860 - 조이스틱 : 그리디
import Foundation
func solution(_ name:String) -> Int {
  let name = Array(name)
  let aValue = Int(Character("A").asciiValue!)
  let zValue = Int(Character("Z").asciiValue!)
  var updown = 0 // 알파벳 바꾸는 횟수
  var leftright = name.count - 1 // 문자 이동 횟수
  
  for startIndex in 0..<name.count {
    let sValue = Int(name[startIndex].asciiValue!)
    updown += min(sValue - aValue, zValue - sValue+1) // A, Z 중 더 가까운곳으로 이동
    
    var endIndex = startIndex + 1
    // A가 있으면 건너뜀
    while endIndex < name.count && name[endIndex] == "A" {
      endIndex += 1
    }
    // startIndex를 찍고 endIndex로 돌아가는 경우
    let moveFront = startIndex*2 + (name.count - endIndex)
    
    // endIndex를 먼저 찍고 startIndex로 돌아가는 경우
    let moveBack = (name.count - endIndex)*2 + startIndex
    
    leftright = min(leftright, moveFront)
    leftright = min(leftright, moveBack)
  }
  return updown + leftright
}

