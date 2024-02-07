//
//  BOJ_10597.swift
//  Algorithm
//
//  Created by 임영선 on 2024/02/07.
//

// https://www.acmicpc.net/problem/10597
// BOJ 10597 - DFS: 순열장난

import Foundation

let n = Array(readLine()!).map {String($0)}
var answer: [String] = []
var visited = Array(repeating: false, count: 51)
visited[0] = true

func DFS(depth: Int, arr: [Int]) {
    // depth가 끝까지 왔을 때
    if depth == n.count {
        // arr 정렬 후 1씩 증가하는지 확인
        let arrSorted = arr.sorted()
        for i in 0..<arrSorted.count-1 {
            if arrSorted[i]+1 != arrSorted[i+1] {
                return
            }
        }
        // 1씩 증가한다면 답 출력 후 종료
        print(Array(arr).map{String($0)}.joined(separator: " "))
        exit(0)
    }
    var num = Int(n[depth])!
    
    // 현재까지 arr에 없는 숫자일 때 DFS 돌림
    if num <= 50 && !visited[num] {
        var arrCopy = arr
        arrCopy.append(num)
        visited[num] = true
        DFS(depth: depth+1, arr: arrCopy)
        visited[num] = false
    }
    
    // 마지막인덱스면 넘어감
    if depth == n.count-1 {
        return
    }
    
    // 두자리 숫자도 만들어서 없는 숫자면 DFS 돌림
    num = (num*10) + Int(n[depth+1])!
    if num <= 50 && !visited[num] {
        var arrCopy = arr
        arrCopy.append(num)
        visited[num] = true
        DFS(depth: depth+2, arr: arrCopy)
        visited[num] = false
    }
}

DFS(depth: 0, arr: [])

