//
//  BOJ_2629.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/15.
//

// https://www.acmicpc.net/problem/2629
// BOJ 2629 - DP, 양팔저울: 골드3

import Foundation

let n = Int(readLine()!)! // 가지고 있는 추의 개수
let weights = readLine()!.split(separator: " ").map {Int(String($0))!}
let m = Int(readLine()!)! // 확인할 구슬 개수
let targets = readLine()!.split(separator: " ").map {Int(String($0))!}

var dp = Array(repeating: Array(repeating: false, count: 40001), count: 31) // visited[몇번째][무게]

func solve(depth: Int, weight: Int) {
    if dp[depth][weight] {
        return
    }
    dp[depth][weight] = true
    if depth == n {
        return
    }
    solve(depth: depth+1, weight: abs(weight-weights[depth])) // 왼쪽에 무게를 다는 경우
    solve(depth: depth+1, weight: weight+weights[depth]) // 오른쪽에 무게를 다는 경우
    solve(depth: depth+1, weight: weight) // 무게를 아예 안다는 경우
}

solve(depth: 0, weight: 0)

var answer: [String] = []
for i in 0..<m {
    answer.append(dp[n][targets[i]] ? "Y" : "N")
}
print(answer.joined(separator: " "))

