//
//  이모티콘 할인행사.swift
//  Algorithm
//
//  Created by 임영선 on 2023/10/25.
//

import Foundation

func solution(_ users:[[Int]], _ emoticons:[Int]) -> [Int] {
    
    // 가입자 수, 판매액 계산해서 리턴 ex) [1, 5100]
    func calcResult(_ percents: [Int]) -> [Int] {
        var answer = [0, 0]
        for i in 0..<users.count {
            var total = 0
            for j in 0..<emoticons.count {
                // 기준 할인 금액 이상이면 구매
                if users[i][0] <= percents[j] {
                    total += Int(Double(emoticons[j]) * Double(100-percents[j]) * 0.01)
                }
            }
            // 만약 일정 금액 이상이면 이모티콘 플러스 가입
            if total >= users[i][1] {
                answer[0] += 1
            }
            else {
                answer[1] += total
            }
        }
        return answer
    }
    
    var answer = [0, 0]
    let percentList = [10, 20, 30, 40]
    
    func DFS(_ count: Int, _ percents: [Int]) {
        // 이모티콘들의 할인률이 결정 되었으면
        if count == emoticons.count {
            let result = calcResult(percents)
            // 현재보다 이모티콘 가입자수가 크면 무조건 바꿈
            if answer[0] < result[0] {
                answer = result
            }
            
            // 현재보다 이모티콘 가입자수는 같지만 총 금액이 큰 경우 바꿈
            else if answer[0] == result[0] && answer[1] < result[1] {
                answer = result
            }
        }
        else {
            // 10, 20, 30, 40 퍼센트 계속 DFS 돌림
            for i in 0..<4 {
                var arr = percents
                arr.append(percentList[i])
                DFS(count+1, arr)
            }
        }
    }
    
    DFS(0, [])
    
    return answer
}


