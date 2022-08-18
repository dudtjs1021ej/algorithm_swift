//
//  BOJ_16234.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/18.
//  BOJ 16234 - 인구이동 : BFS
import Foundation

let read = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
let n = read[0]; let l = read[1]; let r = read[2]

var graph = [[Int]]()
var check = Array(repeating: Array(repeating: 0, count: n), count: n)

for _ in 0..<n {
    let readline = readLine()!.components(separatedBy: " ").map({Int(String($0))!})
    graph.append(readline)
}

let dx = [0,0,-1,1]
let dy = [1,-1,0,0]

var count = 0
var sum = 0
var save = [[[Int]]]()
var arr = [[Int]]()
var unity = false

func dfs(x:Int, y:Int) {
    check[x][y] = 1
    arr.append([x,y])
    for i in 0..<4 {
        let nx = dx[i] + x
        let ny = dy[i] + y
        if nx > -1 && nx < n && ny > -1 && ny < n {
            let minus = abs(graph[nx][ny] - graph[x][y])
            if check[nx][ny] == 0 && minus >= l && minus <= r {
                check[nx][ny] = 1
                dfs(x: nx, y: ny)
            }
        }
    }
}

var realcount = 0

while true {
    for a in 0..<n {
        for b in 0..<n {
            count = 0
            sum = 0
            arr.removeAll()
            
            dfs(x: a, y: b)
            if arr.count > 1 {
                save.append(arr)
            }
        }
    }
    if save.count > 0 {
        for i in save {
            var sum = 0
            var count = 0
            for j in i {
                sum += graph[j[0]][j[1]]
                count += 1
            }
            for j in i {
                graph[j[0]][j[1]] = sum / count
            }
        }
    }
    
    
    if save.count == 0 {
        break
    }
    
    save.removeAll()
    check = Array(repeating: Array(repeating: 0, count: n), count: n)
    
    realcount += 1

}

print(realcount)

