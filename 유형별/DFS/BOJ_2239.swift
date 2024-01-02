//
//  BOJ_2239.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/24.
//
// https://www.acmicpc.net/problem/2239
// BOJ 2239
// DFS - 스도쿠

import Foundation

var zeros: [(height: Int, width: Int)] = []
var boards: [[Int]] = []

for i in 0..<9 {
    let input = readLine()!.map {Int(String($0))!}
    boards.append(input)
    for j in 0..<9 {
        // 0의 가로,세로 정보들을 담아둠
        if input[j] == 0 {
            zeros.append((i, j))
        }
    }
    
}

// 스도쿠에 넣을 수 있는 숫자인지 체크
func isEnabledNum(num: Int, height: Int, width: Int) -> Bool {
    // 가로 0~8, 세로 0~8에 해당하는 숫자가 있으면 false
    for i in 0..<9 {
        if boards[i][width] == num {
            return false
        }
        if boards[height][i] == num {
            return false
        }
    }
    
    // 3*3 가로 세로 범위 계산
    var heightRange: (start: Int, end: Int) = (0,0)
    var widthRange: (start: Int, end: Int) = (0,0)
    switch height {
    case 0,1,2:
        heightRange = (0,2)
    case 3,4,5:
        heightRange = (3,5)
    case 6,7,8:
        heightRange = (6,8)
    default:
        break
    }
    
    switch width {
    case 0,1,2:
        widthRange = (0,2)
    case 3,4,5:
        widthRange = (3,5)
    case 6,7,8:
        widthRange = (6,8)
    default:
        break
    }
    
    for w in widthRange.start...widthRange.end {
        for h in heightRange.start...heightRange.end {
            // 3*3에 해당 번호가 있으면 false
            if boards[h][w] == num {
                return false
            }
        }
    }
    return true
}

let zeroCount = zeros.count

func DFS(depth: Int) {
    // 0의 개수가 depth일 때
    if depth == zeroCount {
        for board in boards {
            print(board.map {String($0)}.joined())
        }
        exit(0)
    }
    else {
        let zeroHeight = zeros[depth].height
        let zeroWidth = zeros[depth].width
        // 1~9 하나하나 DFS로 넣어봄 (사전순)
        for j in 1...9 {
            if isEnabledNum(num: j, height: zeroHeight, width: zeroWidth) {
                boards[zeroHeight][zeroWidth] = j
                DFS(depth: depth+1)
                boards[zeroHeight][zeroWidth] = 0
            }
        }
    }
}



DFS(depth: 0)

/*
 103000509
 002109400
 000704000
 300502006
 060000050
 700803004
 000401000
 009205800
 804000107
 */
