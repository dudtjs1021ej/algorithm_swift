//
//  BOJ_2643.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/05.
//

// https://www.acmicpc.net/problem/2643
// BOJ 2643 - DP: 색종이 올려놓기, 골드4

import Foundation

let n = Int(readLine()!)!
var size: [(width: Int, height: Int)] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let a = input[0]; let b = input[1]
    
    // 더 큰 쪽을 width로 저장
    if a >= b {
        size.append((a,b))
    }
    else {
        size.append((b,a))
    }
}

// 내림차순 정렬 (width가 큰 순, 같으면 height가 큰 순)
size.sort { a,b in
    if a.width == b.width {
        return a.height > b.height
    }
    return a.width > b.width
}
print(size)
var dp = Array(repeating: 1, count: n)

for i in 1..<n {
    for j in 0..<i {
        // 들어갈 수 있는 사이즈이면
        if size[i].width <= size[j].width && size[i].height <= size[j].height {
            dp[i] = max(dp[i], dp[j]+1)
        }
    }
}

print(dp.max()!)
