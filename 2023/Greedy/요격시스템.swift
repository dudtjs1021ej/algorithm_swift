//
//  요격시스템.swift
//  Algorithm
//
//  Created by 임영선 on 2023/12/22.
//

import Foundation

func solution(_ targets:[[Int]]) -> Int {
    // 끝나는 지점 기준으로 오름차순 정렬
    var targets = targets.sorted { (a,b) in
        return a[1] < b[1]
    }
    var end = 0 // 쏜 미사일의 끝점을 저장
    var answer = 0
    for target in targets {
        // 시작점이 현재 end보다 크거나 같으면 다른 미사일 쏴야함 (범위를 벗어남)
        if end <= target[0] {
            answer += 1
            end = target[1]
        }
    }
    return answer
}
