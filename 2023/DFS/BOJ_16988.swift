//
//  BOJ_16988.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/14.
//

// https://www.acmicpc.net/problem/16988
// BOJ 16988 - DFS: Baaaaaaaaaduk2 (Easy), 골드3

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0]; let width = input[1]

var map: [[Int]] = []
var twoVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)
var zeroVisited: [[Bool]] = Array(repeating: Array(repeating: false, count: width), count: height)

for _ in 0..<height {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

var zeroCount: Int = 0
var twoCount: Int = 0
var zeroPoints: [[Int]] = []
var arr: [(zeroPoints: [[Int]], twoCount: Int)] = []

/*
 1. 모든 2를 DFS로 돌리고 2의 개수, 그 주변의 0의 개수, 0의 좌표를 구한다.
 2. 0의 개수(=바둑 두는 개수)가 1 또는 2인 경우만 arr 저장한다.
 ex)
 [
 (zeroPoints: [[1, 1], [0, 0]], twoCount: 7),
 (zeroPoints: [[2, 3], [3, 4]], twoCount: 5),
 (zeroPoints: [[2, 3], [3, 4]], twoCount: 3)
 ]
 */

func DFS(x: Int, y: Int) {
    twoCount += 1
    twoVisited[y][x] = true
    
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        
        if nx >= 0 && nx < width && ny >= 0 && ny < height {
            if map[ny][nx] == 0 && !zeroVisited[ny][nx] {
                zeroVisited[ny][nx] = true
                zeroCount += 1
                zeroPoints.append([ny, nx])
            }
            
            if map[ny][nx] == 2 && !twoVisited[ny][nx] {
                DFS(x: nx, y: ny)
            }
        }
    }
}

for y in 0..<height {
    for x in 0..<width {
        if !twoVisited[y][x] && map[y][x] == 2 {
            zeroCount = 0
            twoCount = 0
            zeroPoints = []
            zeroVisited = Array(repeating: Array(repeating: false, count: width), count: height)
            DFS(x: x, y: y)
            
            // 돌을 1개 또는 2개 두면 해결되는 경우만 체크
            if zeroCount == 1 || zeroCount == 2 {
                arr.append((zeroPoints, twoCount))
            }
        }
    }
}

// 돌을 두는 케이스가 0개면 0 출력
if arr.count == 0 {
    print(0)
    exit(0)
}

// 돌을 두는 케이스가 1개면 해당 2의개수 출력
if arr.count == 1 {
    print(arr[0].twoCount)
    exit(0)
}

// 상대말의 개수 내림차순 정렬, 같다면 둘 수 있는 수가 적은 순 정렬
arr.sort { a, b in
    if a.twoCount == b.twoCount {
        return a.zeroPoints.count < b.zeroPoints.count
    }
    return a.twoCount > b.twoCount
}

var maxTwoCount = 0
var selectedPoints: [[Int]] = []
var totalTwoCount = 0

for i in 0..<arr.count {
    let a = arr[i]
    var selectedCount = a.zeroPoints.count
    selectedPoints = a.zeroPoints
    totalTwoCount = a.twoCount
    
    for j in i+1..<arr.count {
        let b = arr[j]
        
        // 현재 선택한 돌이 1개고 지금 케이스도 돌이 1개일 때
        if selectedCount == 1 && b.zeroPoints.count == 1 {
            // 좌표 다르면 1개 더 둠
            if a.zeroPoints != b.zeroPoints {
                selectedPoints += b.zeroPoints
                totalTwoCount += b.twoCount
                selectedCount = 2
                
            }
            // 좌표가 같으면 돌수만 추가
            else if a.zeroPoints == b.zeroPoints {
                totalTwoCount += b.twoCount
            }
        }
        // 현재 선택한 돌이 2개일 때
        if selectedCount == 2 {
            // 둘 다 같은 좌표면 돌수 추가
            if b.zeroPoints.count == 2 {
                if a.zeroPoints.contains(b.zeroPoints[0]) && a.zeroPoints.contains(b.zeroPoints[1]) {
                    totalTwoCount += b.twoCount
                }
            }
            // 선택한 돌 중에 같은 좌표가 있으면 돌수 추가
            else if b.zeroPoints.count == 1 {
                if a.zeroPoints.contains(b.zeroPoints[0]) {
                    totalTwoCount += b.twoCount
                }
            }
        }
    }
    if maxTwoCount < totalTwoCount {
        maxTwoCount = totalTwoCount
    }
}

print(maxTwoCount)

