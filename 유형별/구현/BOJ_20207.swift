//
//  BOJ_20207.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/01.
//
// https://www.acmicpc.net/problem/20207
// BOJ 20207 - 구현: 달력

import Foundation

let n = Int(readLine()!)!
var schedules: [(start: Int, end: Int)] = []
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let start = input[0]; let end = input[1]
    schedules.append((start, end))
}

var days: [Int] = Array(repeating: 0, count: 367) // 1일 ~ 365일에 대해 각 스케줄의 개수를 갖는다.

for schedule in schedules {
    // ex) 2~4일 스케줄이면 2,3,4 인덱스에 +1
    for i in stride(from: schedule.start, through: schedule.end, by: 1) {
        days[i] += 1
    }
}

var width = 0
var height = 0
var answer = 0

for i in 1..<days.count {
    let day = days[i]
    // 0이 아닌 연속된 구간의 width를 구한다.
    if day > 0 {
        width += 1
        height = max(height, day) // 높이는 해당 구간의 최대 스케줄 개수
    }
    
    // 연속된 구간이 끝났으면
    else if day == 0 {
        answer += width*height
        width = 0
        height = 0
    }
}

print(answer)
