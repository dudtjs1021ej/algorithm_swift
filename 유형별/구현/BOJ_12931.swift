//
//  BOJ_12931.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/12.
//

// https://www.acmicpc.net/problem/12931
// BOJ 12931 - 구현: 두 배 더하기, 골드5

let n = Int(readLine()!)!
var arr = readLine()!.split(separator: " ").map {Int(String($0))!}.filter {$0 != 0} // 배열을 0을 모두 제거 후 저장
var answer = 0

while !arr.isEmpty {
    let oddIndex = arr.firstIndex {$0 % 2 == 1}.map {Int(String($0))!} // 홀수의 인덱스를 찾음 (없으면 nil)

    // 홀수가 존재하면
    if let oddIndex = oddIndex {
        arr[oddIndex] -= 1
    }
    // 홀수가 없으면 모두 나누기 2해줌
    else {
        arr = arr.map {$0/2}
    }

    // 0은 모두 제거해줌
    arr = arr.filter {$0 != 0}
    answer += 1
}

print(answer)
