//
//  BOJ_14923.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/14.

// https://www.acmicpc.net/problem/14923
// BOJ 14923
// 미로 탈출 - BFS

import Foundation

let input1 = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input1[0]; let width = input1[1]

let input2 = readLine()!.split(separator: " ").map {Int(String($0))!}
let currentY = input2[0]-1; let currentX = input2[1]-1

let input3 = readLine()!.split(separator: " ").map {Int(String($0))!}
let targetY = input3[0]-1; let targetX = input3[1]-1

var map: [[Int]] = []

for _ in 0..<height {
    let arr = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(arr)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]


func BFS() -> Int {
    // 벽을 부순 경우 1, 아니면 0
    // ex) x,y좌표에 벽을 뿌신 경우의 방문 처리 -> visited[y][x][1] = true
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 2), count: width+1), count: height+1)

    visited[currentY][currentX][0] = true
    var queue: [(x: Int, y: Int, isConvert: Bool, count: Int)] =
                [(currentX, currentY, false, 0)]
    var index = 0
    
    while queue.count > index {
        let node = queue[index]
        index += 1
        if node.x == targetX && node.y == targetY {
            return node.count
        }
        else {
            for i in 0..<4 {
                let nx = dx[i]+node.x
                let ny = dy[i]+node.y
                
                // 벽 범위에 해당 하는지
                if ny >= 0 && nx >= 0 && ny < height && nx < width {
                    
                    // 벽을 부신 경우
                    if node.isConvert {
                        // 길인 경우 이동
                        if map[ny][nx] == 0 && !visited[ny][nx][1] {
                            visited[ny][nx][1] = true
                            queue.append((nx, ny, true, node.count+1))
                        }
                    }
                    
                    // 벽을 부수지 않은 경우
                    else {
                        // 벽이어도 뿌수고 이동
                        if map[ny][nx] == 1 && !visited[ny][nx][1] {
                            visited[ny][nx][1] = true
                            queue.append((nx, ny, true, node.count+1))
                        }
                        
                        // 길인 경우 이동
                        else if map[ny][nx] == 0 && !visited[ny][nx][0] {
                            visited[ny][nx][0] = true
                            queue.append((nx, ny, false, node.count+1))
                        }
                    }
                }
            }
        }
    }
    return -1
}

print(BFS())


