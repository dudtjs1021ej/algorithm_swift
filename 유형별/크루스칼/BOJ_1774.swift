//
//  BOJ_1774.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/09.
//
// https://www.acmicpc.net/problem/2643
// BOJ 1774 - 크루스칼: 우주신과의 교감, 골드3

import Foundation

// 부모 찾는 함수
func getParent(_ n: Int) -> Int {
    if parent[n] == n {
        return n
    }
    parent[n] = getParent(parent[n])
    return parent[n]
}

// 두 부모를 합치는 함수
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

// 같은 부모인지 확인하는 함수
func isEqualsParent(_ a: Int, _ b: Int) -> Bool {
    let aParent = getParent(a)
    let bParent = getParent(b)
    return aParent == bParent
}

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var points: [(x: Double, y: Double)] = [(0, 0)]
var parent: [Int] = [] // 각 부모가 담긴 배열
var edges: [(a: Int, b: Int, distance: Double)] = []

for i in 0...n {
    parent.append(i)
}

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Double(String($0))!}
    let x = input[0]; let y = input[1]
    points.append((x, y))
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    // 두 노드를 연결시킴
    unionParent(a, b)
}

for i in 1...n {
    if i == n {
        break
    }
    for j in i+1...n {
        let a = points[i]; let b = points[j]
        let distance = sqrt(pow(a.x - b.x, 2) + pow(a.y - b.y, 2)) // 거리 계산
        edges.append((i, j, distance))
    }
}

// 거리 기준 오름차순 정렬
edges.sort { a, b in
    return a.distance < b.distance
}

var answer: Double = 0
for edge in edges {
    // 부모가 같지 않은 경우 == 사이클이 발생하지 않는 경우 간선 연결
    if !isEqualsParent(edge.a, edge.b) {
        unionParent(edge.a, edge.b)
        answer += edge.distance
    }
}

print(String(format: "%.2f", answer))
