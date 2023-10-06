//
//  부분집합구하기.swift
//  Algorithm
//
//  Created by 임영선 on 2023/10/06.
// 부분집합 구하기
// DFS

import Foundation

let n = Int(readLine()!)!
var isUsed = Array(repeating: false, count: n+1)

func DFS(_ v: Int) {
    if v > n {
        var answer = ""
        for i in 1...n {
            if isUsed[i] {
                answer += "\(i) "
            }
        }
        print(answer)
    } else {
        isUsed[v] = true
        DFS(v+1)
        isUsed[v] = false
        DFS(v+1)
    }
}

DFS(1)
