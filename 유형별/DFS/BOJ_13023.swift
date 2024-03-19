//
//  BOJ_13023.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/19.
//

// https://www.acmicpc.net/problem/13023
// BOJ 13023 - DFS, ABCDE: 골드5

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var graph: [[Int]] = Array(repeating: [], count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    graph[a].append(b)
    graph[b].append(a)
}

var visited = Array(repeating: false, count: n)
var isAnswer = false

func DFS(n: Int, depth: Int) {
    if depth >= 5 {
        isAnswer = true
        return
    }
    
    for num in graph[n] {
        if !visited[num] {
            visited[num] = true
            DFS(n: num, depth: depth+1)
            visited[num] = false
        }
    }
}

for i in 0..<n {
    visited = Array(repeating: false, count: n)
    isAnswer = false
    visited[i] = true
    DFS(n: i, depth: 1)
    if isAnswer {
        print(1)
        exit(0)
    }
}

print(0)


/*
 5 4
 0 1
 1 2
 2 3
 3 0
 */


/*
5 5
0 1
1 3
1 4
4 3
3 2
 */

