//
//  BOJ_16935.swift
//  Algorithm
//
//  Created by 임영선 on 2024/03/27.
//

// https://www.acmicpc.net/problem/16935
// BOJ 16935 - 구현, 배열 돌리기 3: 골드5

import Foundation

let input = readLine()!.split(separator: " ").map {Int(String($0))!}
let height = input[0]; let width = input[1]; let r = input[2]

func calc1(_ arr: [[Int]]) -> [[Int]] {
    let height = arr.count
    var answer: [[Int]] = []
    for i in stride(from: height-1, through: 0, by: -1) {
        answer.append(arr[i])
    }
    return answer
}

func calc2(_ arr: [[Int]]) -> [[Int]] {
    let height = arr.count; let width = arr[0].count
    var answer: [[Int]] = []
    for h in 0..<height {
        var a: [Int] = []
        for w in stride(from: width-1, through: 0, by: -1) {
            a.append(arr[h][w])
        }
        answer.append(a)
    }
    return answer
}

func calc3(_ arr: [[Int]]) -> [[Int]] {
    let height = arr.count; let width = arr[0].count
    var answer: [[Int]] = []
    for w in 0..<width {
        var a: [Int] = []
        for h in stride(from: height-1, through: 0, by: -1) {
            a.append(arr[h][w])
        }
        answer.append(a)
    }
    return answer
}

func calc4(_ arr: [[Int]]) -> [[Int]] {
    let height = arr.count; let width = arr[0].count
    var answer: [[Int]] = []
    for w in stride(from: width-1, through: 0, by: -1) {
        var a: [Int] = []
        for h in 0..<height {
            a.append(arr[h][w])
        }
        answer.append(a)
    }
    return answer
}

func calc5(_ arr: [[Int]]) -> [[Int]] {
    let height = arr.count; let width = arr[0].count
    let heightHalf = height/2
    let widthHalf = width/2
    
    var group1: [[Int]] = []
    for h in 0..<heightHalf {
        var a: [Int] = []
        for w in 0..<widthHalf {
            a.append(arr[h][w])
        }
        group1.append(a)
    }
    
    var group2: [[Int]] = []
    for h in 0..<heightHalf {
        var a: [Int] = []
        for w in widthHalf..<width {
            a.append(arr[h][w])
        }
        group2.append(a)
    }
    
    var group4: [[Int]] = []
    for h in heightHalf..<height {
        var a: [Int] = []
        for w in 0..<widthHalf {
            a.append(arr[h][w])
        }
        group4.append(a)
    }
    
    var group3: [[Int]] = []
    for h in heightHalf..<height {
        var a: [Int] = []
        for w in widthHalf..<width {
            a.append(arr[h][w])
        }
        group3.append(a)
    }
    
    var answer: [[Int]] = []
    for h in 0..<heightHalf {
        answer.append(group4[h]+group1[h])
    }
    for h in 0..<heightHalf {
        answer.append(group3[h]+group2[h])
    }
    return answer
}

func calc6(_ arr: [[Int]]) -> [[Int]] {
    let height = arr.count; let width = arr[0].count
    let heightHalf = height/2
    let widthHalf = width/2
    
    var group1: [[Int]] = []
    for h in 0..<heightHalf {
        var a: [Int] = []
        for w in 0..<widthHalf {
            a.append(arr[h][w])
        }
        group1.append(a)
    }
    
    var group2: [[Int]] = []
    for h in 0..<heightHalf {
        var a: [Int] = []
        for w in widthHalf..<width {
            a.append(arr[h][w])
        }
        group2.append(a)
    }
    
    var group4: [[Int]] = []
    for h in heightHalf..<height {
        var a: [Int] = []
        for w in 0..<widthHalf {
            a.append(arr[h][w])
        }
        group4.append(a)
    }
   
    var group3: [[Int]] = []
    for h in heightHalf..<height {
        var a: [Int] = []
        for w in widthHalf..<width {
            a.append(arr[h][w])
        }
        group3.append(a)
    }

    var answer: [[Int]] = []
    for h in 0..<heightHalf {
        answer.append(group2[h]+group3[h])
    }
    for h in 0..<heightHalf {
        answer.append(group1[h]+group4[h])
    }
    return answer
}

var arr: [[Int]] = []
for _ in 0..<height {
    arr.append(readLine()!.split(separator: " ").map {Int(String($0))!})
}

let nums = readLine()!.split(separator: " ").map {Int(String($0))}
for n in nums {
    switch n {
    case 1:
        arr = calc1(arr)
    case 2:
        arr = calc2(arr)
    case 3:
        arr = calc3(arr)
    case 4:
        arr = calc4(arr)
    case 5:
        arr = calc5(arr)
    case 6:
        arr = calc6(arr)
    default:
        break
    }
}

for h in 0..<arr.count {
    print(arr[h].map {String($0)}.joined(separator: " "))
}

