//
//  BOJ_9251.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/22.
//

// https://www.acmicpc.net/problem/9251
// BOJ 9251 - LCS, LCS: 골드5

import Foundation

let str1 = Array(readLine()!).map {String($0)}
let str2 = Array(readLine()!).map {String($0)}

var arr = Array(repeating: Array(repeating: 0, count: str1.count+1), count: str2.count+1)

for i in 1...str1.count {
    for j in 1...str2.count {
        // 같은 문자면
        if str1[i-1] == str2[j-1] {
            arr[j][i] = arr[j-1][i-1]+1
        }
        else {
            arr[j][i] = max(arr[j-1][i], arr[j][i-1])
        }
    }
}

print(arr[str2.count][str1.count])

