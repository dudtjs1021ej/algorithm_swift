//
//  BOJ_14621.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/18.
//

// https://www.acmicpc.net/problem/14621
// BOJ 14621 - 크루스칼, 나만 안되는 연애: 골드3

import Foundation

let input1 = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input1[0]; let m = input1[1]

let genders = readLine()!.split(separator: " ").map {String($0)}

var edges: [(a: Int, b: Int, distance: Int, isEnabled: Bool)] = []
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]; let distance = input[2]
    let isEnabled = genders[a-1] != genders[b-1]
    edges.append((a, b, distance, isEnabled))
}

var parent = [Int](0...n)
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
    
    // 더 작은쪽을 부모로 합침
    if aParent < bParent {
        parent[bParent] = aParent
    } else {
        parent[aParent] = bParent
    }
}

edges.sort {$0.distance < $1.distance}
var answer = 0
var edgeCount = 0
for edge in edges {
    // 같은 성별로 이어져 있거나 부모가 같으면(사이클이 생겨서) 넘어감
    if !edge.isEnabled || getParent(edge.a) == getParent(edge.b) {
        continue
    }
    
    unionParent(edge.a, edge.b)
    answer += edge.distance
    edgeCount += 1
}

print(edgeCount==n-1 ? answer : -1)

/*
5 7
M W W W M
1 2 12
1 3 10
4 2 5
5 2 5
2 5 10
3 4 3
5 4 7
 */

