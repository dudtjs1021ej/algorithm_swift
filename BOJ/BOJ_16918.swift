//
//  BOJ_16918.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/17.
//  BOJ 16918 - 봄버맨 : BFS
import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let (r, c, n) = (input[0], input[1], input[2])
var board = [[String]]()
var queue: [(Int, Int)] = []
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for _ in 0..<r {
  let input = Array(readLine()!).map {String($0)}
  board.append(input)
}

func BFS() {
  while !queue.isEmpty {
    let (x, y) = queue.removeFirst()
    board[x][y] = "."
    for i in 0..<4 {
      let nx = dx[i] + x
      let ny = dy[i] + y
      if nx>=0 && nx<r && ny>=0 && ny<c && board[nx][ny] == "O" {
        board[nx][ny] = "."
      }
    }
  }
}

for i in 1...n {
  if i == 1 {
    for i in 0..<r {
      for j in 0..<c {
        if board[i][j] == "O" {
          queue.append((i, j))
        }
      }
    }
  }
  else if i % 2 == 1{
    BFS()
    for i in 0..<r {
      for j in 0..<c {
        if board[i][j] == "O" {
          queue.append((i, j))
        }
      }
    }
  }
  else {
    board = Array(repeating: Array(repeating: "O", count: c), count: r)
  }
}

for i in board {
  print(i.joined())
}

