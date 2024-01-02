//
//  BOJ_11657.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/06.
//

// https://www.acmicpc.net/problem/11657
// BOJ 11657 - 벨만포드 알고리즘: 타임머신, 골드4

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var edges: [(start: Int, end: Int, cost: Int)] = []
let INF = Int.max
var distance = Array(repeating: INF, count: n+1)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    edges.append((input[0], input[1], input[2]))
}

func bellmanford(start: Int) -> Bool {
    distance[start] = 0
    for i in 1...n {
        for j in 0..<m {
            let edge = edges[j]
            if distance[edge.start] != INF && distance[edge.end] > distance[edge.start]+edge.cost {
                distance[edge.end] = distance[edge.start]+edge.cost
                
                if i == n {
                    return true
                }
            }
        }
    }
    return false
}

if bellmanford(start: 1) {
    print("-1")
}
else {
    distance[2...n].forEach {
        print($0==INF ? "-1" : $0)
    }
}

