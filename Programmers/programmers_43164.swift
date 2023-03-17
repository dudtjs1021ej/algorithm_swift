//
//  programmers_43164.swift
//  Algorithm
//
//  Created by 임영선 on 2023/03/17.
//

import Foundation


// 프로그래머스 - 여행 경로: DFS

func solution(_ tickets:[[String]]) -> [String] {
    var visited = Array(repeating: false, count: tickets.count) // 티켓의 방문
    let tickets = tickets.sorted { $0[1] < $1[1] } // 도착지 알파벳 순으로 정렬
    var answer = [String]()
    
    func DFS(_ airport: String) {
        // 만약 모든 티켓을 사용했다면
        if !visited.contains(false) {
            answer.append(airport)
            return
        }
        for i in 0..<tickets.count {
            let startAirport = tickets[i][0]
            let endAirport = tickets[i][1]
            if startAirport == airport && !visited[i] {
                visited[i] = true
                answer.append(startAirport)
                DFS(endAirport)
                
                // 모든 티켓을 사용하지 못했다면
                if visited.contains(false) {
                    // 갔던 경로를 취소하고 다시 되돌림
                    answer.removeLast()
                    visited[i] = false
                }
                // 모든 티켓을 사용했다면
                else {
                    return
                }
            }
        }
    }
    
    DFS("ICN")
    
    return answer
}
