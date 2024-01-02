//
//  BOJ_1963.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/13.
//

// https://www.acmicpc.net/problem/1963
// BOJ 1963
// 소수 경로 - BFS

import Foundation

// 소수인지 판별하는 메소드
func isPrime(_ num: Int) -> Bool {
    let s = Int(sqrt(Double(num))) // 제곱근까지만 체크하며 소수인지 판별
    for i in 2...s {
        if num % i == 0 {
            return false
        }
    }
    return true
}

let n = Int(readLine()!)!

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    var num = input[0];
    let target = input[1];

    var visited = Array(repeating: false, count: 10000)

    func BFS(_ num: Int) -> Int {
        // 같은 숫자면 0 리턴
        if num == target {
            return 0
        }
        
        var queue: [(num: Int, count: Int)] = [(num, 0)]
        visited[num] = true
        var count = -1
        
        while !queue.isEmpty {
            let node = queue.removeFirst()
            
            for i in 0..<4 {
                for j in stride(from: 9, through: 0, by: -1) {
                    var arr = Array(String(node.num)).map {Int(String($0))!}
                    
                    // 첫째자리 수가 0인 경우는 패스
                    if i == 0 && j == 0 {
                        break
                    }
                    if arr[i] == j {
                        continue
                    }
                    arr[i] = j
                    let n = Int(arr.map {String($0)}.joined())!
                    
                    // 타겟 넘버를 찾으면
                    if n == target {
                        return node.count+1
                    }
                    
                    // 방문하지 않았고 소수면 enqueue
                    if !visited[n] && isPrime(n) {
                        queue.append((n, node.count+1))
                        visited[n] = true
                    }
                }
            }
        }
        return count
    }
    let answer = BFS(num)
    print(answer == -1 ? "Impossible" : answer)
}



