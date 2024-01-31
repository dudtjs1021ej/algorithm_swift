//
//  BOJ_2666.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/31.
//

// https://www.acmicpc.net/problem/2666
// BOJ 2666 - dp: 벽장문의 이동

import Foundation

let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let openIndex1 = input[0]; let openIndex2 = input[1]

let num = Int(readLine()!)!
var indexList: [Int] = []
for _ in 0..<num {
    let n = Int(readLine()!)!
    indexList.append(n) // 문 순서의 리스트
}


var dp = Array(repeating: Array(repeating: Array(repeating: -1, count: 21), count: 21), count: 21)

func solve(openIndex1: Int, openIndex2: Int, depth: Int) -> Int {
    if depth == num {
        return 0
    }
    
    // -1로 방문 처리
    if dp[depth][openIndex1][openIndex2] != -1 {
        return dp[depth][openIndex1][openIndex2]
    }
    
    dp[depth][openIndex1][openIndex2] = 0
    
    let currentIndex = indexList[depth]
    let distance1 = abs(currentIndex-openIndex1)
    let distance2 = abs(currentIndex-openIndex2)
    
    dp[depth][openIndex1][openIndex2] = min(
        distance1+solve(openIndex1: currentIndex, openIndex2: openIndex2, depth: depth+1),
        distance2+solve(openIndex1: openIndex1, openIndex2: currentIndex, depth: depth+1)
    )
    return dp[depth][openIndex1][openIndex2]
}

print(solve(openIndex1: openIndex1, openIndex2: openIndex2, depth: 0))


var answer = Int.max

func DFS(openIndex1: Int, openIndex2: Int, depth: Int, distance: Int) {
    // 문 이동을 다 했으면 (depth가 문순서 개수만큼 되었으면)
    if depth == num {
        answer = min(answer, distance) // 거리의 최솟값 갱신
        return
    }
    let currentIndex = indexList[depth]
    let distance1 = abs(currentIndex-openIndex1)
    let distance2 = abs(currentIndex-openIndex2)

    DFS(openIndex1: currentIndex, openIndex2: openIndex2, depth: depth+1, distance: distance+distance1) // 열린문1로 이동한 경우
    DFS(openIndex1: openIndex1, openIndex2: currentIndex, depth: depth+1, distance: distance+distance2) // 열린문2로 이동한 경우
}

//DFS(openIndex1: openIndex1, openIndex2: openIndex2, depth: 0, distance: 0)

//print(answer)

