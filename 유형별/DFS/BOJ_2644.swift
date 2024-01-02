//
//  BOJ_2644.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/20.
//
// https://www.acmicpc.net/problem/2644
// BOJ 2644
// DFS - 촌수 계산

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let target1 = input[0]; let target2 = input[1]
let m = Int(readLine()!)!

var arr: [[Int]] = Array(repeating: [], count: n+1)
var visited = Array(repeating: false, count: n+1)

// 각 인덱스에 연결된 버텍스 넣어줌 [[] [2,3] [1,7,8,9] ...]
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    arr[a].append(b)
    arr[b].append(a)
}

func DFS(depth: Int, v: Int) {
    // 타겟 찾으면 출력 후 종료
    if v == target2 {
        print(depth)
        exit(0)
    }
    else {
        for num in arr[v] {
            if !visited[num] {
                visited[num] = true
                DFS(depth: depth+1, v: num)
                visited[num] = false
            }
        }
    }
}

DFS(depth: 0, v: target1)
print(-1) // 타겟 못찾으면 출력
