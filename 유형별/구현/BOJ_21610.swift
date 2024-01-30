//
//  BOJ_21610.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/30.
//
// https://www.acmicpc.net/problem/21610
// BOJ 21610 - 구현: 마법사 상어와 비바라기

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let size = input[0]; let m = input[1]

var map: [[Int]] = []
var isCloud = Array(repeating: Array(repeating: false, count: size), count: size)

for _ in 0..<size {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
}

var cloudPoints: [(y: Int, x: Int)] = [(size-1, 0), (size-1, 1), (size-2, 0), (size-2, 1)]

// ←, ↖, ↑, ↗, →, ↘, ↓, ↙
let cloudDx = [0, -1, -1, 0, 1, 1, 1, 0, -1]
let cloudDy = [0, 0, -1, -1, -1, 0, 1, 1, 1]

// 대각선
let dx = [-1, 1, -1, 1]
let dy = [-1, -1, 1, 1]

// 구름을 움직이는 함수
func moveCloud(distance: Int, d: Int) {
    var movedPoints: [(y: Int, x: Int)] = []
    
    for point in cloudPoints {
        var x = point.x
        var y = point.y
        var count = distance
        while count > 0 {
            count -= 1
            x += cloudDx[d]
            y += cloudDy[d]
            
            if x >= size {
                x = 0
            }
            else if x < 0 {
                x = size-1
            }
            
            if y >= size {
                y = 0
            }
            else if y < 0 {
                y = size-1
            }
        }
        
        // 이전에 구름이었던 곳이 아니면
        if !isCloud[y][x] {
            isCloud[y][x] = true
            movedPoints.append((y, x))
        }
    }

    for point in movedPoints {
        let x = point.x
        let y = point.y
        map[y][x] += 1 // 구름인 곳 물 +1
        
        for i in 0..<4 {
            let nx = dx[i] + x
            let ny = dy[i] + y
            
            // 대각선이 범위에 속하면
            if nx >= 0 && nx < size && ny >= 0 && ny < size {
                // 대각선이 물이 있는 곳이거나 구름에 속하면
                if map[ny][nx] > 0 || isCloud[ny][nx] {
                    map[y][x] += 1 // 물 +1
                }
            }
        }
    }
}

// 구름을 만드는 함수
func createCloud() {
    cloudPoints = []
    for y in 0..<size {
        for x in 0..<size {
            // 2 이상이고 이 전에 구름이 아니었으면
            if map[y][x] >= 2 && !isCloud[y][x] {
                map[y][x] -= 2
                cloudPoints.append((y, x))
            }
        }
    }
}

for _ in 0..<m {
    isCloud = Array(repeating: Array(repeating: false, count: size), count: size)
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let d = input[0]; let distance = input[1]
    moveCloud(distance: distance, d: d)
    createCloud()
}

var sum = 0
for y in 0..<size {
    for x in 0..<size {
        sum += map[y][x]
    }
}
print(sum)
/*
 
 5 4
 0 0 1 0 2
 2 3 2 1 0
 4 3 2 9 0
 1 0 2 9 0
 8 8 2 1 0
 1 3
 3 4
 8 1
 4 8
 */


/*
 5 1
 0 0 1 0 2
 2 3 2 1 0
 4 3 2 9 0
 1 0 2 9 0
 8 8 2 1 0
 1 3
 */
