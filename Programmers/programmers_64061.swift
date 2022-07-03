//
//  programmers_64061.swift
//  Algorithm
//
//  Created by 임영선 on 2022/07/03.
//
// 프로그래머스 64061
// 인형뽑기
import Foundation

func solution(_ board:[[Int]], _ moves:[Int]) -> Int {
  var board: [[Int]] = board
    var basket: [Int] = []
    var count: Int = 0
    for move in moves {
        for i in 0..<board.count {
          let item = board[i][move-1]
            if  item != 0 {
              if !basket.isEmpty && basket[basket.count-1] == item { // 바구니에 같은 인형이 들어있다면
                basket.popLast()
                count += 2
              }
              else {
                basket.append(item)
              }
              board[i][move-1] = 0
              break
            }
        }
    }
    return count
}

