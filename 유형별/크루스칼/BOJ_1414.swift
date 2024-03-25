//
//  BOJ_1414.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/25.
//

// https://www.acmicpc.net/problem/1414
// BOJ 1414 - 크루스칼, 불우이웃돕기: 골드3

import Foundation

let n = Int(readLine()!)!
var edges: [(a: Int, b: Int, length: Int)] = []
var parent = [Int](0...n-1)
var totalLength = 0 // 랜선 총 길이

// a부터 z는 1부터 26을 나타내고, A부터 Z는 27부터 52
// a -> 97 , A -> 65
// a -> 1 , A -> 27

for i in 0..<n {
    let input = Array(readLine()!)
    for j in 0..<n {
        if input[j] == "0" {
            continue
        }
        var length = 0
        if input[j].isLowercase {
            length = Int(input[j].asciiValue! - 96)
        }
        else {
            length = Int(input[j].asciiValue! - 38)
        }
        totalLength += length
        
        if i != j {
            edges.append((i, j, length))
        }
    }
}

func getParent(_ n: Int) -> Int {
    if parent[n] == n {
        return n
    }
    parent[n] = getParent(parent[n])
    return parent[n]
}

func unionParent(_ a: Int, _ b: Int) {
    let aParent = getParent(a)
    let bParent = getParent(b)
    if aParent < bParent {
        parent[bParent] = aParent
    } else {
        parent[aParent] = bParent
    }
}

edges.sort {$0.length < $1.length}

var edgeCount = 0
var answer = 0
for edge in edges {
    if getParent(edge.a) == getParent(edge.b) {
        continue
    }
    edgeCount += 1
    answer += edge.length
    unionParent(edge.a, edge.b)
}

print(edgeCount==n-1 ? totalLength-answer : -1)

