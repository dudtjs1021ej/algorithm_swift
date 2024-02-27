//
//  BOJ_3745.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/27.
//

// https://www.acmicpc.net/problem/3745
// BOJ 3745 - 이분탐색, 오름세: 골드2

import Foundation

var answer = ""
var buffer: [UInt8] = Array(FileHandle.standardInput.readDataToEndOfFile()), byteIdx = 0; buffer.append(0)

@inline(__always) func readByte() -> UInt8 {
    defer { byteIdx += 1 }
    let bp = buffer.withUnsafeBufferPointer { $0[byteIdx] }
    if bp == 0 { print(answer); exit(0) } // 여기서 EOF 처리
    return bp
}

@inline(__always) func readInt() -> Int {
    var number = 0, byte = readByte(), isNegative = false
    while byte == 10 || byte == 32 { byte = readByte() }
    if byte == 45 { byte = readByte(); isNegative = true }
    while 48...57 ~= byte { number = number * 10 + Int(byte - 48); byte = readByte() }
    return number * (isNegative ? -1 : 1)
}


func solve(_ n: Int, _ arr: [Int]) -> Int {
    var stack: [Int] = []
    for num in arr {
        if let last = stack.last {
            if last < num {
                stack.append(num)
            }
            else {
                var start = 0; var end = stack.count
                while start < end {
                    let mid = (start+end)/2
                    if num > stack[mid] {
                        start = mid+1
                    }
                    else {
                        end = mid
                    }
                }
                stack[end] = num
            }
        }
        else {
            stack.append(num)
        }
    }
    return stack.count
}

while true {
    let n = readInt()
    var arr = [Int]()
    for _ in 0..<n { arr.append(readInt()) }
    answer += "\(solve(n, arr))\n"
}

/*
6
5 2 1 4 5 3
3
1 1 1
4
4 3 2 1
 */
