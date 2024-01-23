//
//  prgrammers_258711.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/23.
//
//  prgrammers_258711 - 그래프: 도넛과 막대 그래프, 레벨2

import Foundation

func solution(_ edges:[[Int]]) -> [Int] {
    let MAX = 1000001
    var outEdges: [Int] = Array(repeating: 0, count: MAX)
    var inEdges: [Int] = Array(repeating: 0, count: MAX)
    
    for edge in edges {
        let a = edge[0]; let b = edge[1]
        outEdges[a] += 1
        inEdges[b] += 1
    }
    
    var initNode = 0  // 초기정점
    var total = 0 // 그래프 총 개수
    var barGraphCount = 0 // 막대그래프 개수
    var eightGraphCount = 0 // 8자그래프 개수
    
    for i in 1..<MAX {
        let inCount = inEdges[i]
        let outCount = outEdges[i]
        
        // 들어오는 간선은 0개고 나가는 간선 개수가 2개 이상이면 -> 초기노드
        if inCount == 0 && outCount >= 2 {
            initNode = i
            total = outCount
         }
        
        // 들어오는 간선은 1개이상이고 나가는 개수가 없으면 -> 막대그래프
        else if inCount >= 1 && outCount == 0 {
            barGraphCount += 1
        }
        
        // 들어오는 간선 2개 이상, 나가는 간선 2개 이상이면 -> 8자 그래프
        else if inCount >= 2 && outCount >= 2 {
            eightGraphCount += 1
        }
    }
    
    return [initNode, total-barGraphCount-eightGraphCount, barGraphCount, eightGraphCount]
}
