//
//  BOJ_6087.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/07.
//

// https://www.acmicpc.net/problem/6087
// BOJ 6087 - BFS, 레이저통신: 골드3

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let width = input[0]; let height = input[1]
var cPoints: [(x: Int, y: Int)] = []

var map: [[String]] = []
for i in 0..<height {
    let input2 = readLine()!.map {String($0)}
    
    for j in 0..<input2.count {
        if input2[j] == "C" {
            cPoints.append((j, i))
        }
    }
    map.append(input2)
}

func BFS() {
    // 방향    0  1  2  3
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var queue: [(x: Int, y: Int, mirrorCount: Int, direct: Int)] = [(cPoints[0].x, cPoints[0].y, 0, -1)]
    
    for i in 0..<4 {
        queue.append((cPoints[0].x, cPoints[0].y, 0, i))
    }
   
    var visited = Array(repeating: Array(repeating: 100000, count: width), count: height) // 방문 배열에 거울의 개수 저장
    var index = 0
    visited[cPoints[0].y][cPoints[0].x] = -1
    
    while index < queue.count {
        let node = queue[index]
        index += 1
        
        if node.x == cPoints[1].x && node.y == cPoints[1].y {
            print(visited[cPoints[1].y][cPoints[1].x])
            break
        }

        for direct in 0..<4 {
            var nx = dx[direct]+node.x
            var ny = dy[direct]+node.y
           
            while true {
                if nx<0 || nx>=width || ny<0 || ny>=height || map[ny][nx] == "*" {
                    break
                }
                
                if visited[node.y][node.x]+1 < visited[ny][nx] {
                    visited[ny][nx] = visited[node.y][node.x]+1
                    queue.append((nx, ny, visited[node.y][node.x]+1, direct))
                }
                nx += dx[direct]
                ny += dy[direct]
            }
            
        }
    }
}

BFS()

