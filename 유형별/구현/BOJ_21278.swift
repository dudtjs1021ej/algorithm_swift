//
//  BOJ_21278.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/28.
//

// https://www.acmicpc.net/problem/21278
// BOJ 21278 - 플로이드 워셜: 호석이 두 마리 치킨, 골드5

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0] ; let m = input[1]

var graph: [[Int]] = Array(repeating: Array(repeating: 101, count: n+1), count: n+1) // 거리 다 101로 초기화

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    // 연결된 곳 거리는 1
    graph[a][b] = 1
    graph[b][a] = 1
}

// 자기자신의 거리는 0
for i in 1...n {
    graph[i][i] = 0
}

// 최단거리 계산
for k in 1...n {
    for a in 1...n {
        for b in 1...n {
            // 직행으로 가는 것보다 거쳐가는게 더 빠르면 바꿈
            graph[a][b] = min(graph[a][b], graph[a][k]+graph[k][b])
        }
    }
}

var minDistance: (a: Int, b: Int, distance: Int) = (101, 101, Int.max)
for a in 1...n-1 {
    for b in a+1...n {
        var distance = 0
        for k in 1...n {
            distance += (min(graph[k][a], graph[k][b]))*2
        }
        if distance < minDistance.distance {
            minDistance = (a, b, distance)
        }
    }
}

print(minDistance.a, minDistance.b, minDistance.distance)

