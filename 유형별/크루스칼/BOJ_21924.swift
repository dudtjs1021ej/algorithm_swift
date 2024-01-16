//
//  BOJ_21924.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/16.
//

// https://www.acmicpc.net/problem/21924
// BOJ 21924 - 크루스칼: 도시건설, 골드4

import Foundation

final class FileIO {
    private let buffer:[UInt8]
    private var index: Int = 0

    init(fileHandle: FileHandle = FileHandle.standardInput) {
        buffer = Array(try! fileHandle.readToEnd()!)+[UInt8(0)] // 인덱스 범위 넘어가는 것 방지
    }

    @inline(__always) private func read() -> UInt8 {
        defer { index += 1 }
        return buffer[index]
    }

    @inline(__always) func readInt() -> Int {
        var sum = 0
        var now = read()
        var isPositive = true

        while now == 10
                || now == 32 { now = read() } // 공백과 줄바꿈 무시
        if now == 45 { isPositive.toggle(); now = read() } // 음수 처리
        while now >= 48, now <= 57 {
            sum = sum * 10 + Int(now-48)
            now = read()
        }

        return sum * (isPositive ? 1:-1)
    }
}

let fio = FileIO()
let n = fio.readInt()
let m = fio.readInt()

//let input = readLine()!.split(separator: " ").map {Int(String($0))!}
//let n = input[0]; let m = input[1]

var edges: [(a: Int, b: Int, cost: Int)] = []
var parent = [Int](0...n)
var total = 0

for _ in 0..<m {
    let a = fio.readInt()-1
    let b = fio.readInt()-1
    let cost = fio.readInt()
//    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
//    let a = input[0]; let b = input[1]; let cost = input[2]
    total += cost
    edges.append((a, b, cost))
}

func find(_ a: Int) -> Int {
    if parent[a] == a {
        return a
    }
    parent[a] = find(parent[a])
    return parent[a]
}


func union(_ a: Int, _ b: Int) {
    let aParent = find(a)
    let bParent = find(b)
    if aParent < bParent {
        parent[bParent] = aParent
    } else {
        parent[aParent] = bParent
    }
}

edges.sort {$0.cost < $1.cost}
var edgeCount = 0
var sum = 0

for edge in edges {
    // 부모가 같으면 사이클이 생겨 넘어감
    if find(edge.a) == find(edge.b) {
        continue
    }
    union(edge.a, edge.b)
    edgeCount += 1
    sum += edge.cost
}

if edgeCount == (n-1) {
    print(total-sum)
} else {
    print(-1)
}

/*
7 9
1 2 15
2 3 7
1 3 3
1 4 8
3 5 6
4 5 4
4 6 12
5 7 1
6 7 6
 */

