//
//  BOJ_10216.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/09.
//
// Count Circle Groups
// 범위가 겹쳐져 있으면 같은 구역으로 판단해 구역의 개수를 구하는 문제

import Foundation

let t = Int(readLine()!)!

var rArr: [[[Int]]] = []
var visited = Array(repeating: false, count: 3001)

func DFS(_ rArr: [[Int]], _ index: Int) {
    let x1 = rArr[index][0]
    let y1 = rArr[index][1]
    let r1 = rArr[index][2]
    for i in 0..<rArr.count {
        if !visited[i] {
            let x2 = rArr[i][0]
            let y2 = rArr[i][1]
            let r2 = rArr[i][2]
            let xDistance = x1-x2
            let yDistance = y1-y2
            let radiusSum = r1+r2
           
            // 원 사이의 거리 <= 반지름의 합보다 크면 원이 겹쳐진 것으로 판단
            if (xDistance*xDistance) + (yDistance*yDistance) <= radiusSum*radiusSum {
                visited[i] = true
                DFS(rArr, i)
            }
        }
    }
}

for _ in 0..<t {
    visited = Array(repeating: false, count: 3001)
    let n = Int(readLine()!)!
    var arr: [[Int]] = []
    var count = 0
    for _ in 0..<n {
        let a = readLine()!.split(separator: " ").map {Int(String($0))!}
        arr.append(a)
    }
   
    for i in 0..<n {
        if !visited[i] {
            visited[i] = true
            DFS(arr, i)
            count += 1
        }
    }
    print(count)
}

// ========================================================================================

// 처음부터 map을 5000*5000으로 잡아주고 DFS 돌리면 메모리 초과..
let t = Int(readLine()!)!
let MAX_NUM = 5001
var map: [[[Int]]] = Array(repeating: Array(repeating: [], count: MAX_NUM), count: MAX_NUM)

var rArr: [[[Int]]] = []
let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]

for _ in 0..<t {
    let n = Int(readLine()!)!
    var arr: [[Int]] = []
    for _ in 0..<n {
        let a = readLine()!.split(separator: " ").map {Int(String($0))!}
        arr.append(a)
    }
    rArr.append(arr)
}

// 단독 영역인지 아닌지 체크
var isOneArea = Array(repeating: true, count: MAX_NUM)

/*
 내 영역이면 해당 맵의 배열에 인덱스를 더해주며 DFS 돌림
ex)
 [0] [0, 1] [1] [1] [] []
 [0] [] [] [1] [] []
 [] [] [] [] [] []
 [] [] [] [] [] []
 */
func DFS(index: Int, depth: Int, x: Int, y: Int, r: Int) {
    if depth == r {
        return
    }
    else {
        for i in 0..<4 {
            let nx = x+dx[i]
            let ny = y+dy[i]
            if nx <= MAX_NUM && ny <= MAX_NUM && nx >= 0 && ny >= 0 && !map[ny][nx].contains(index) {
                if !map[ny][nx].isEmpty {
                    isOneArea[index] = false
                }
                map[ny][nx].append(index)
                DFS(index: index, depth: depth+1, x: nx, y: ny, r: r)
            }
        }
    }
}

for i in 0..<rArr.count {
    let rCount = rArr[i].count
    var count = 0
    for j in 0..<rCount {
        let x = rArr[i][j][0]
        let y = rArr[i][j][1]
        let r = rArr[i][j][2]
        map[y][x].append(j)
        DFS(index: j, depth: 0, x: x, y: y, r: r)
        if isOneArea[j] {
            count += 1
        }
    }
    print(count)
    isOneArea = Array(repeating: true, count: MAX_NUM)
    map = Array(repeating: Array(repeating: [], count: MAX_NUM), count: MAX_NUM)
}
