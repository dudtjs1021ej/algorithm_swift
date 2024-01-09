//
//  BOJ_13418.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/09.
//

// https://www.acmicpc.net/problem/13418
// BOJ 13418 - 크루스칼: 학교 탐방하기, 골드3

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
var parent = [Int](0...n)

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

var edges: [(a: Int, b: Int, distance: Int)] = []

for _ in 0..<m+1 {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]; let distance = input[2];
    edges.append((a, b, distance))
}

// 최악의 경로
edges.sort { $0.distance < $1.distance } // distance 오름차순 정렬 (0이면 오르막길이라 최악의 경로 찾음)
var zeroCount = 0

for edge in edges {
    // 부모가 같으면 사이클이 생겨서 넘어감
    if getParent(edge.a) == getParent(edge.b) {
        continue
    }
    
    unionParent(edge.a, edge.b)
    // 오르막길 개수 셈
    if edge.distance == 0 {
        zeroCount += 1
    }
}
var maxDistance = zeroCount*zeroCount

// 최선의 경로
edges.sort { $0.distance > $1.distance } // distance 내림차순 정렬 (1이면 내리막길이라 최선의 경로 찾음)
zeroCount = 0
parent = [Int](0...n)

for edge in edges {
    // 부모가 같으면 사이클이 생겨서 넘어감
    if getParent(edge.a) == getParent(edge.b) {
        continue
    }
    
    unionParent(edge.a, edge.b)
    // 오르막길 개수 셈
    if edge.distance == 0 {
        zeroCount += 1
    }
}
var minDistance = zeroCount*zeroCount

print(maxDistance-minDistance)

