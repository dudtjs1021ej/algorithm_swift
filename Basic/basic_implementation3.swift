//
//  basic_implementation3.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/05.
//

import Foundation
// 구현 - 왕실의 나이트
let alphabet = ["a", "b", "c", "d", "e", "f", "g", "h"]
var input = Array(readLine()!).map {String($0)}
let moves = [[2,1], [2,-1], [-2,1], [-2,-1], [1,2], [-1,2], [1,-2], [-1,-2]]

var column = alphabet.firstIndex(of: input[0])! + 1
var row = Int(input[1])!
var count = 0

for move in moves {
  let x = column + move[0]
  let y = row + move[1]
  
  if x>=1 && x<=8 && y>=1 && y<=8 {
    count += 1
  }
}

print(count)


