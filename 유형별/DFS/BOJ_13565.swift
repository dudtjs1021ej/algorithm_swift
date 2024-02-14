//
//  BOJ_13565.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/14.
//

// https://www.acmicpc.net/problem/13565
// BOJ 13565 - DFS 침투: 실버2

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0]; let width = input[1]
var map: [[Int]] = []
var visited = Array(repeating: Array(repeating: false, count: width), count: height)

for _ in 0..<height {
    let input = Array(readLine()!).map {Int(String($0))!}
    map.append(input)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func DFS(x: Int, y: Int) {
    // 마지막줄에 왔으면 종료
    if y == height-1 {
        print("YES")
        exit(0)
    }
    for i in 0..<4 {
        let nx = dx[i]+x
        let ny = dy[i]+y
        // 범위 안에 있고 방문하지 않았고 0이면
        if nx>=0 && nx<width && ny>=0 && ny<height && !visited[ny][nx] && map[ny][nx] == 0 {
            visited[ny][nx] = true
            DFS(x: nx, y: ny)
        }
    }
}

for i in 0..<width {
    DFS(x: i, y: 0)
}

print("NO")

