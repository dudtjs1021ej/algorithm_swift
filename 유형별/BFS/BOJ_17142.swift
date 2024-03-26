//
//  BOJ_17142.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/26.
//

// https://www.acmicpc.net/problem/17142
// BOJ 17142 - DFS, BFS, 연구소3: 골드3

import Foundation

typealias Point = (y: Int, x: Int)

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]
let MAX = 987654321
var virusPoints: [Point] = []
var map: [[Int]] = []
var zeroCount = 0 // 빈칸 개수

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
    
    for j in 0..<n {
        if input[j] == 2 {
            virusPoints.append((i, j))  // 바이러스 놓을 수 있는 위치 저장
        }
        else if input[j] == 0 {
            zeroCount += 1 // 빈칸 개수 저장
        }
    }
}

var visitedVirusPoint = Array(repeating: false, count: virusPoints.count)
var combinationList: [[Point]] = []

// 바이러스를 놓을 수 있는 모든 조합 구함
func combination(depth: Int, targetCount: Int, arr: [Point]) {
    if arr.count == targetCount {
        combinationList.append(arr)
        return
    }
    
    for i in depth..<virusPoints.count {
        if !visitedVirusPoint[i] {
            visitedVirusPoint[i] = true
            var arrCopy = arr
            arrCopy.append(virusPoints[i])
            combination(depth: i, targetCount: targetCount, arr: arrCopy)
            visitedVirusPoint[i] = false
        }
    }
    
}

combination(depth: 0, targetCount: m, arr: [])

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

// 최소 시간을 리턴
func BFS(virusList: [Point]) -> Int {
    var queue: [(point: Point, time: Int)] = []
    var visited = Array(repeating: Array(repeating: false, count: n), count: n)
    
    for v in virusList {
        queue.append((v, 0))
        visited[v.y][v.x] = true
    }
    var count = 0
    
    
    while !queue.isEmpty {
        let node = queue.removeFirst()
        
        // 빈 칸 개수 세줌
        if map[node.point.y][node.point.x] == 0 {
            count += 1
        }
        
        // 모든 빈칸이 감염되면 종료
        if count == zeroCount {
            return node.time
        }
        
        for i in 0..<4 {
            let ny = dy[i]+node.point.y
            let nx = dx[i]+node.point.x
            if ny>=0 && ny<n && nx>=0 && nx<n && !visited[ny][nx] && map[ny][nx] != 1 {
                visited[ny][nx] = true
                queue.append(((ny, nx), node.time+1))
            }
        }
    }
    return MAX
}

var answer = MAX

// 바이러스를 놓을 수 있는 모든 조합의 각각 시간을 구함
for combination in combinationList {
    let time = BFS(virusList: combination)
    answer = min(time, answer)
}
print(answer == MAX ? -1 : answer)

