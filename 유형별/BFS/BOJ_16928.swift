//
//  BOJ_16928.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/14.
//

// https://www.acmicpc.net/problem/16928
// BOJ 16928 - BFS 뱀과 사다리 게임: 골드5

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var board = Array(repeating: 0, count: 101) // 0이면 사다리나 뱀이 없다고 가ㅈ

for _ in 0..<n+m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    board[a] = b
}

func BFS() {
    var queue: [(num: Int, count: Int)] = [(1, 0)]
    var visited = Array(repeating: false, count: 101)
    visited[1] = true
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        // 100칸에 도착하면 종료
        if node.num == 100 {
            print(node.count)
            exit(0)
        }
        
        // 1. 사다리나 뱀이 있을 때
        if board[node.num] != 0 {
            var num = node.num
            
            // 사다리나 뱀이 안나올때까지 계속 이동
            while true {
                if board[num] == 0 {
                    break
                }
                num = board[num]
            }
            
            for i in 1...6 {
                // 1~6 더한 숫자로 이동
                if i+num <= 100 && !visited[i+num] {
                    visited[i+num] = true
                    queue.append((i+num, node.count+1))
                }
            }
        }
        
        
        // 2. 사다리나 뱀이 없을 때
        else {
            for i in 1...6 {
                // 1~6 더한 숫자로 이동
                if i+node.num <= 100 && !visited[i+node.num] {
                    visited[i+node.num] = true
                    queue.append((i+node.num, node.count+1))
                }
            }
        }
    }
}

BFS()

