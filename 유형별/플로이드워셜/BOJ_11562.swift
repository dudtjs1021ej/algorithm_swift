//
//  BOJ_11562.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/29.
//

// https://www.acmicpc.net/problem/11562
// BOJ 11562 - 플로이드 워셜: 백양로 브레이크

import Foundation

let MAX = 100000
let input = readLine()!.split(separator: " ").map { Int(String($0))! }
let n = input[0]; let m = input[1]

var graph: [[Int]] = Array(repeating: Array(repeating: MAX, count: n+1), count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]; let isTwoWay = input[2] == 1
    
    graph[a][b] = 0 // 연결된 곳은 비용이 0
    if isTwoWay {
        graph[b][a] = 0 // 양방향이기 때문에 반대쪽 비용도 0
    } else {
        graph[b][a] = 1 // 단방향을 연결하는 비용은 1
    }
}

// 자기 자신으로 가는 비용은 0
for i in 1...n {
    graph[i][i] = 0
}

for k in 1...n {
    for a in 1...n {
        for b in 1...n {
            // 직행으로 가는 것보다 거쳐가는게 더 빠르면 바꿈
            graph[a][b] = min(graph[a][b], graph[a][k]+graph[k][b])
        }
    }
}


let k = Int(readLine()!)!
for _ in 0..<k {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    print(graph[a][b])
}

