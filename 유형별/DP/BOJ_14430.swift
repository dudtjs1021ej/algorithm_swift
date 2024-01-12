//
//  BOJ_14430.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/12.
//
// https://www.acmicpc.net/problem/14430
// BOJ 14430 - DP: 자원 캐기, 실버2

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0]; let width = input[1]

var map: [[Int]] = []

for _ in 0..<height {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
}

let dx = [-1,0]
let dy = [0,-1]
var answer = 0

for y in 0..<height {
    for x in 0..<width {
        let value = map[y][x]
        for i in 0..<2 {
            let nx = dx[i]+x
            let ny = dy[i]+y
            // 왼, 위가 범위안에 있을 때
            if nx>=0 && nx<width && ny>=0 && ny<height {
                map[y][x] = max(map[y][x], value+map[ny][nx])
            }
        }
    }
}

print(map[height-1][width-1])
