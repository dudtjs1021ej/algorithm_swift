//
//  BOJ_16174.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/05.
//

import Foundation
// https://www.acmicpc.net/problem/BOJ_16174
// BOJ BOJ_16174 - DFS 점프왕 젤리: 실버1

import Foundation

let n = Int(readLine()!)!
var map: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
}

// 아래, 오른쪽만 이동
let dx = [1,0]
let dy = [0,1]
var visited = Array(repeating: Array(repeating: false, count: n), count: n)

func DFS(x: Int, y: Int, num: Int) {
    if x == n-1 && y == n-1 {
        print("HaruHaru")
        exit(0)
    }
    else {
        for i in 0..<2 {
            if num != 0 {
                let nx = (dx[i]*num)+x
                let ny = (dy[i]*num)+y
                if nx>=0 && nx<n && ny>=0 && ny<n && !visited[ny][nx] {
                    visited[ny][nx] = true
                    DFS(x: nx, y: ny, num: map[ny][nx])
                }
            }
            
        }
    }
}

DFS(x: 0, y: 0, num: map[0][0])
print("Hing")
