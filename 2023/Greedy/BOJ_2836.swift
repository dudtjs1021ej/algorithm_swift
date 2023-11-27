//
//  BOJ_2836.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/27.
//

// https://www.acmicpc.net/problem/2239
// BOJ 2836 - 수상 택시

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let n = input[0]; let m = input[1]

// 뒤로 가는 차들
var arr: [(start: Int, end: Int)] = []
var answer = m

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let start = input[0]; let end = input[1]
    
    // 뒤로 가는 차면
    if start > end {
        arr.append((start, end))
    }
}

// 시작점 큰순, 같다면 끝점 작은 순으로 정렬
arr.sort { (a,b) in
    if a.start == b.start {
        return a.end < b.end
    }
    return a.start > b.start
}

if arr.count == 0 {
    print(answer)
    exit(0)
}
else if arr.count == 1 {
    print(answer+(arr[0].start-arr[0].end)*2)
    exit(0)
}

var currentPoint: (start: Int, end: Int) = (arr[0].start, arr[0].end)

for i in 1..<arr.count {
    let p = arr[i]
    if currentPoint.start == p.start {
        continue
    }
    
    // 만약 시작점이 현재 포인트 사이에 있다면
    else if p.start >= currentPoint.end && p.start <= currentPoint.start {
        currentPoint.end = min(currentPoint.end, p.end)
    }
    
    // 겹치지 않는 좌표면
    else if p.start < currentPoint.end {
        answer += (currentPoint.start-currentPoint.end)*2
        currentPoint = (p.start, p.end)
    }
}

answer += (currentPoint.start-currentPoint.end)*2
print(answer)

