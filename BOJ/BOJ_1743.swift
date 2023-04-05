//
//  BOJ_1743.swift
//  Algorithm
//
//  Created by 임영선 on 2023/04/05.
//  BOJ 1743 - 음식물 피하기 : DFS

import Foundation

let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let height = input[0], width = input[1], k = input[2]
var map = Array(repeating: Array(repeating: 0, count: width), count: height) // 쓰레기 있으면 1 없으면 0
var visited = Array(repeating: Array(repeating: false, count: width), count: height)
let dy = [0, 0, -1, 1] // 상하좌우
let dx = [-1, 1, 0, 0]
var answer = Int.min
var count = 0

for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map { Int(String($0))! }
    let h = input[0]-1, w = input[1]-1
    map[h][w] = 1 // 쓰레기는 1
}

func DFS(_ x: Int, _ y: Int) {
    visited[y][x] = true // 방문 처리
    count += 1 // 쓰레기 개수 추가
    
    for i in 0..<4 {
        let nx = dx[i] + x
        let ny = dy[i] + y
        // map의 범위에 있고 방문하지 않았고 쓰레기인 경우에만 DFS 돌림
        if nx >= 0 && nx < width && ny >= 0 && ny < height && !visited[ny][nx] && map[ny][nx] == 1 {
            DFS(nx, ny)
        }
    }
    
}

for y in 0..<height {
    for x in 0..<width {
        if map[y][x] == 1 && !visited[y][x] { // 쓰레기이고 방문하지 않은 경우만 DFS 돌림
            count = 0
            DFS(x, y)
            answer = max(answer, count) // DFS 다 돌리고 나온 쓰레기 개수의 max값 저장
        }
        
    }
}

print(answer)
