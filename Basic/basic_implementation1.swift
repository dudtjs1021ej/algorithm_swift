//
//  basic_implementation1.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/04.
//

import Foundation
// 구현 - 상하좌우 문제

let dy = [-1,1,0,0]
let dx = [0,0,-1,1]
let moveTypes = ["L", "R", "U", "D"]
var x = 1
var y = 1

let n = Int(readLine()!)!
let moves = readLine()!.split(separator: " ")

for move in moves {
  for i in 0..<moveTypes.count {
    var nx: Int = 0
    var ny: Int = 0
    
    // 이동 후 좌표 구하기
    if move == moveTypes[i] {
      nx = x + dx[i]
      ny = y + dy[i]
    }
    
    // 공간을 벗어나는 경우 무시
    if nx < 1 || ny < 1 || nx > n || ny > n {
      continue
    }
    
    // 이동 수행
    x = nx
    y = ny
  }
}
print(x, y)

