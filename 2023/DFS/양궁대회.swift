//
//  양궁대회.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/08.
//

import Foundation

func solution(_ n:Int, _ info:[Int]) -> [Int] {
    
    // 어피치와 나의 점수 차이를 리턴
    func getScoreDiff(_ arr: [Int]) -> Int {
        var apeachScore = 0
        var lionScore = 0
        for i in 0..<11 {
            if arr[i] == 0 && info[i] == 0 {
                continue
            }
            if arr[i] > info[i] {
                lionScore += (10-i)
            }
            else {
                apeachScore += (10-i)
            }
        }
        return lionScore - apeachScore
    }
    
    // 더 낮은 점수의 화살이 있으면 true 리턴
    func isMoreThanLowScore(answer: [Int], arr: [Int]) -> Bool {
        for i in stride(from: 10, through: 0, by: -1) {
            if answer[i] < arr[i] {
                return true
            }
            else if answer[i] > arr[i] {
                return false
            }
        }
        return false
    }
    
    var answer = Array(repeating: 0, count: 11)
    var maxScore = 0
   
    func DFS(depth: Int, arrowCount: Int, arr: [Int]) {
        // 끝까지 돌았거나 화살을 다 썼을 경우
        if arrowCount == n || depth == 10 {
            var arr = arr
            
            // 남은 화살이 있다면 그 화살을 0점에 다 넣어줌
            if arrowCount < n {
                arr[10] = n-arrowCount
            }
            
            let score = getScoreDiff(arr) // 점수 차이를 구함
            
            // 점수 차이가 더 크면 정답을 바꿈
            if maxScore < score {
                maxScore = score
                answer = arr
            }
            
            // 현재 정답과 점수차이는 똑같지만 낮은 점수판의 화살이 더 많으면 정답 바꿈
            else if maxScore == score && isMoreThanLowScore(answer: answer, arr: arr) {
                answer = arr
            }
        }
        else {
            let apeachWinCount = info[depth] + 1 // 어피치를 이길 수 있는 개수
            
            // 지금 어피치를 이길 수 있는 화살이 남아있다면
            if apeachWinCount+arrowCount <= n {
                var arrWin = arr
                arrWin[depth] = apeachWinCount
                // 어피치를 이기는 경우 DFS
                DFS(depth: depth+1, arrowCount: arrowCount+apeachWinCount, arr: arrWin)
            }
            
            // 어피치를 지는 경우 DFS (0으로 진다.)
            DFS(depth: depth+1, arrowCount: arrowCount, arr: arr)
        }
    }
    DFS(depth: 0, arrowCount: 0, arr: [0,0,0,0,0,0,0,0,0,0,0])
    
    return maxScore == 0 ? [-1] : answer
}

print(solution(10, [0,0,0,0,0,0,0,0,3,4,3]))
