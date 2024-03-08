//
//  BOJ_6593.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/08.
//

// https://www.acmicpc.net/problem/6593
// BOJ 6593 - BFS, 상범빌딩: 골드5

import Foundation

typealias Point = (floor: Int, y: Int, x: Int)

let points: [Point] = [(-1,0,0), (1,0,0), (0,-1,0), (0,1,0), (0,0,-1), (0,0,1)]

while true {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let floor = input[0]; let height = input[1]; let width = input[2]
    
    if floor==0 && height==0 && width==0 {
        break
    }
    
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: 31), count: 31), count: 31) // visitied[층수][행][열]
    
    var sPoint: Point = (0,0,0)
    var ePoint: Point = (0,0,0)
    var map: [[[String]]] = []
    for f in 0..<floor {
        var floorMap: [[String]] = []
        for h in 0..<height {
            let input = readLine()!.map {String($0)}
            
            // S와 E 위치 저장
            for w in 0..<input.count {
                if input[w] == "S" {
                    sPoint = (f, h, w)
                }
                else if input[w] == "E" {
                    ePoint = (f, h, w)
                }
            }
            floorMap.append(input)
        }
        let _ = readLine()!
        map.append(floorMap)
    }
    
    func BFS() -> String {
        var queue: [(point: Point, count: Int)] = [(sPoint, 0)]
        visited[sPoint.floor][sPoint.y][sPoint.x] = true
        var index = 0
        
        while index < queue.count {
            let node = queue[index]
            let currentFloor = node.point.floor
            let count = node.count
            let y = node.point.y
            let x = node.point.x
            index += 1
            
            if currentFloor == ePoint.floor && y == ePoint.y && x == ePoint.x {
                return "Escaped in \(count) minute(s)."
                
            }
            
            for i in 0..<6 {
                let nx = points[i].x+x
                let ny = points[i].y+y
                let f = points[i].floor+currentFloor
                if nx>=0 && nx<width && ny>=0 && ny<height && f>=0 && f<floor && !visited[f][ny][nx] && map[f][ny][nx] != "#" {
                    visited[f][ny][nx] = true
                    queue.append(((f, ny, nx), count+1))
                }
            }
        }
        return "Trapped!"
    }
    
    print(BFS())
}
