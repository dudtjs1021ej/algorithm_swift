//
//  BOJ_17352.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/29.
//

// https://www.acmicpc.net/problem/17352
// BOJ 17352 - 그래프, 여러분의 다리가 되어 드리겠습니다!: 골드5

import Foundation

let n = Int(readLine()!)!
var edges: [[Int]] = Array(repeating: [], count: n+1) // ex) [[], [2, 3], [1], [1], []]
var visited = Array(repeating: false, count: n+1)

for _ in 0..<n-2 {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    edges[a].append(b)
    edges[b].append(a)
}

var lastNum = 0
func DFS(n: Int) {
    lastNum = n
    for num in edges[n] {
        if !visited[num] {
            visited[num] = true
            DFS(n: num)
        }
    }
}

var count = 0
var answer: [Int] = []
for j in 1...n {
    if count == 2 {
        break
    }
    if !visited[j] {
        visited[j] = true
        count += 1
        DFS(n: j)
        answer.append(lastNum) // DFS의 마지막 숫자를 저장
    }
}

print(answer[0], answer[1])

/*
 
 4
 1 2
 1 3
 
 
 5
 1 2
 2 3
 4 5
 */

