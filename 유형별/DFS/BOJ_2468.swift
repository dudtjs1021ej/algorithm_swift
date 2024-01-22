//
//  BOJ_2468.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/22.
//

// https://www.acmicpc.net/problem/2468
// BOJ 2468 - DFS: 안전 영역, 실버1

import Foundation

let size = Int(readLine()!)!
var map: [[Int]] = []
var heights: Set<Int> = [0]

for _ in 0..<size {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
    for data in input {
        heights.insert(data)
    }
}

var visited = Array(repeating: Array(repeating: false, count: size), count: size)
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

func DFS(_ x: Int, _ y: Int, _ height: Int) {
    for i in 0..<4 {
        let nx = dx[i]+x
        let ny = dy[i]+y
        if nx>=0 && nx<size && ny>=0 && ny<size && !visited[ny][nx] {
            // 기준 높이보다 높으면
            if map[ny][nx] > height {
                visited[ny][nx] = true
                DFS(nx, ny, height)
            }
        }
    }
}

var maxCount = 0
for height in heights {
    visited = Array(repeating: Array(repeating: false, count: size), count: size)
    var count = 0
    for y in 0..<size {
        for x in 0..<size {
            if map[y][x] > height && !visited[y][x] {
                DFS(x, y, height)
                count += 1
            }
        }
    }
    maxCount = max(count, maxCount)
}

print(maxCount)

