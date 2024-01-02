//
//  BOJ_15684.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/02.
//

// https://www.acmicpc.net/problem/15684
// BOJ 15684 - DFS: 사다리 조작, 골드3

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0] // 세로선 개수
let M = input[1] // 사다리 놓은 수
let width = input[2] // 가로선을 놓을 수 있는 개수

var arr: [[Bool]] = Array(repeating: Array(repeating: false, count: 31), count: 31)

for _ in 0..<M {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; // 가로선
    let b = input[1] // 세로선
    arr[a][b] = true
}


func isAnswer() -> Bool {
    for i in 1...height {
        var point = i
        for j in 1...width {
            if arr[j][point] {
                point += 1
            }
            else if point > 1 && arr[j][point-1] {
                point -= 1
            }
        }
        if point != i {
            return false
        }
    }
    return true
}

func DFS(_ h: Int, _ w: Int, target: Int, depth: Int) {
    if target == depth {
        if isAnswer() {
            print(target)
            exit(0)
        }
    }
    else {
        // 앞에 돌려봤던 사다리 조합을 피하기 위해 h부터 돌림
        for i in 1...height {
            for j in 1...width {
                // 현재 사다리가 이어져있거나 양옆에 사다리를 놓았다면 패스
                if arr[j][i] || arr[j][i-1] || arr[j][i+1] {
                    continue
                }
                arr[j][i] = true
                DFS(i, j, target: target, depth: depth+1)
                arr[j][i] = false
            }
        }
    }
}

// 사다리를 놓지 않아도 바로 답이 되면 0 출력
if isAnswer() {
    print(0)
    exit(0)
}

// 1~3개 놓는 경우 돌려봄
for i in 1...3 {
    DFS(1, 1, target: i, depth: 0)
}

print(-1)

