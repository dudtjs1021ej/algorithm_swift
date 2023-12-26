//
//  BOJ_1245.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/26.
//

// https://www.acmicpc.net/problem/1245
// BOJ 1245 - DFS: 농장 관리, 골드5

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0]; let width = input[1]
var map: [[Int]] = []

for _ in 0..<height {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
}

var visited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
var isTop = true

// 상하좌우, 대각선
let dx = [-1, 1, 0, 0, -1, 1, -1, 1]
let dy = [0, 0, -1, 1, -1, 1, 1, -1]

func DFS(top: Int, x: Int, y: Int) {
    for i in 0..<8 {
        let nx = x+dx[i]
        let ny = y+dy[i]
        if nx >= 0 && nx < width && ny >= 0 && ny < height {
            // top보다 큰 지점이 있으면 isTop false로
            if map[ny][nx] > top {
                isTop = false
            }
            
            // top과 높이가 같은 경우에 DFS 돌림
            if !visited[ny][nx] && map[ny][nx] == map[y][x] {
                visited[ny][nx] = true
                DFS(top: top, x: nx, y: ny)
            }
            
        }
    }
}

var answer = 0

for y in 0..<height {
    for x in 0..<width {
        if map[y][x] > 0 && !visited[y][x] {
            visited[y][x] = true
            isTop = true
            DFS(top: map[y][x], x: x, y: y)
            
            // DFS 다 돌리고 나서도 top이 true면
            if isTop {
                answer += 1
            }
        }
        
    }
}

print(answer)

/*
8 7
4 3 2 2 1 0 1
3 3 3 2 1 0 1
2 2 2 2 1 0 0
2 1 1 1 1 0 0
1 1 0 0 0 1 0
0 0 0 1 1 1 0
0 1 2 2 1 1 0
0 1 1 1 2 1 0
 */
