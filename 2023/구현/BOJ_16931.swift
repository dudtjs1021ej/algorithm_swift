//
//  BOJ_16931.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/17.
//

// https://www.acmicpc.net/problem/16931
// 겉넓이 구하기

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0]; let width = input[1];
var paper: [[Int]] = []

for _ in 0..<height {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    paper.append(input)
}

let dx = [-1, 1, 0, 0]
let dy = [0, 0, -1, 1]
var answer = 0

for h in 0..<height {
    for w in 0..<width {
        let cube = paper[h][w]
        
        // 큐브가 0개면 넘어감 (면이 없어서)
        if cube == 0 {
            continue
        }
        var overlap = 0
        // 붙어있는 동서남북 체크
        for i in 0..<4 {
            let nx = dx[i]+w
            let ny = dy[i]+h
            // 동서남북이 범위안에 있으면
            if nx>=0 && ny>=0 && nx<width && ny<height {
                // 겹쳐진 면의 개수를 구한다.
                // ex) 2 3 처럼 2의 왼쪽에 3이 붙어있을 때, 2의 겹쳐진 면의 개수는 최대 2다.
                overlap += min(cube, paper[ny][nx])
            }
        }
        // 큐브가 한 개보다 많을 때
        if cube > 1 {
            // 큐브 수*6에서 큐브의 위아래 붙어있는 면들을 빼주고((cube-1)*2) 겹쳐진 면도 빼준다.
            let num = (cube*6) - ((cube-1)*2) - overlap
            answer += num
        }
        // 큐브가 한 개일 때
        else {
            // 겹쳐진 면을 빼준다.
            let num = cube*6 - overlap
            answer += num
        }
    }
}
print(answer)

