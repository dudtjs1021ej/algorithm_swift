//
//  BOJ_2251.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/19.
//

// https://www.acmicpc.net/problem/2251
// BOJ 2251 - DFS, 물통: 골드5

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let aMax = input[0]; let bMax = input[1]; let cMax = input[2]
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 600), count: 600), count: 600)
var answer: Set<Int> = []

func DFS(a: Int, b: Int, c: Int) {
    if a == 0 {
        answer.insert(c)
    }
    // a에 있는 물을 옮기는 경우
    if a > 0 {
        // a -> b
        if a+b > bMax { // a를 다 부으면 b가 흘러넘칠 때 -> bMax까지만 부어줌
            if !visited[a-(bMax-b)][bMax][c] {
                visited[a-(bMax-b)][bMax][c] = true
                DFS(a: a-(bMax-b), b: bMax, c: c)
            }
        }
        else { // a를 b에 다 부음
            if !visited[0][a+b][c] {
                visited[0][a+b][c] = true
                DFS(a: 0, b: a+b, c: c)
            }
        }
        
        // a -> c
        if a+c > cMax {
            if !visited[a-(cMax-c)][b][cMax] {
                visited[a-(cMax-c)][b][cMax] = true
                DFS(a: a-(cMax-c), b: b, c: cMax)
            }
        }
        else {
            if !visited[0][b][c+a] {
                visited[0][b][c+a] = true
                DFS(a: 0, b: b, c: c+a)
            }
        }
    }
    
    // b에 있는 물을 옮기는 경우
    if b > 0 {
        // b -> a
        if a+b > aMax {
            if !visited[aMax][b-(aMax-a)][c] {
                visited[aMax][b-(aMax-a)][c] = true
                DFS(a: aMax, b: b-(aMax-a), c: c)
            }
        }
        else {
            if !visited[a+b][0][c] {
                visited[a+b][0][c] = true
                DFS(a: a+b, b: 0, c: c)
            }
        }
        
        // b -> c
        if c+b > cMax {
            if !visited[a][b-(cMax-c)][b+c] {
                visited[a][b-(cMax-c)][b+c] = true
                DFS(a: a, b: b-(cMax-c), c: b+c)
            }
        }
        else {
            if !visited[a][0][c+b] {
                visited[a][0][c+b] = true
                DFS(a: a, b: 0, c: c+b)
            }
        }
    }
    
    // c에 있는 물을 옮기는 경우
    if c > 0 {
        // c -> a
        if a+c > aMax {
            if !visited[aMax][b][c-(aMax-a)] {
                visited[aMax][b][c-(aMax-a)] = true
                DFS(a: aMax, b: b, c: c-(aMax-a))
            }
        }
        else {
            if !visited[a+c][b][0] {
                visited[a+c][b][0] = true
                DFS(a: a+c, b: b, c: 0)
            }
        }
        
        // c -> b
        if b+c > bMax {
            if !visited[a][bMax][c-(bMax-b)] {
                visited[a][bMax][c-(bMax-b)] = true
                DFS(a: a, b: bMax, c: c-(bMax-b))
            }
        }
        else {
            if !visited[a][b+c][0] {
                visited[a][b+c][0] = true
                DFS(a: a, b: b+c, c: 0)
            }
        }
    }
}

DFS(a: 0, b: 0, c: cMax)
let sortedAnswer = Array(answer.sorted()).map {String($0)}
print(sortedAnswer.joined(separator: " "))

