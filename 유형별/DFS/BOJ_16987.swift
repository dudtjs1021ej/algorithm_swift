//
//  BOJ_16987.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/15.
//
// https://www.acmicpc.net/problem/16987
// BOJ 16987 - DFS, 계란으로 계란치기: 골드5

import Foundation

let n = Int(readLine()!)!
var eggs: [(n: Int, power: Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let n = input[0]; let power = input[1]
    eggs.append((n, power))
}

var answer = 0
func DFS(depth: Int) {
    // 모든 계란을 다 썼다면
    if depth == n {
        let count = eggs.filter {$0.n <= 0}.count // 깨진 계란 개수 셈
        answer = max(answer, count)
        return
    }
    
    // 이미 손에 든 계란이 깨져있다면
    if eggs[depth].n <= 0 {
        DFS(depth: depth+1) // 다음 계란으로
        return
    }
    
    var isEnabledBreak = false
    for i in 0..<n {
        // 현재 들고있는 계란이면 넘어감
        if i == depth {
            continue
        }
        
        // 아직 깨지지 않은 계란이 있다면 서로 깸
        if eggs[i].n > 0 {
            isEnabledBreak = true
            eggs[i].n -= eggs[depth].power
            eggs[depth].n -= eggs[i].power
            DFS(depth: depth+1) // 다음 계란으로 넘어감
            eggs[i].n += eggs[depth].power
            eggs[depth].n += eggs[i].power
        }
    }
    
    // 깰 수 있는 계란이 없었다면
    if !isEnabledBreak {
        DFS(depth: depth+1) // 다음 계란으로 넘어감
    }
}

DFS(depth: 0)
print(answer)

