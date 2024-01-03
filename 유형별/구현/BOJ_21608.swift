//
//  BOJ_21608.swift
//  Algorithm
//
//  Created by 임영선 on 2024/01/03.
//

// https://www.acmicpc.net/problem/21608
// BOJ 21608 - 구현: 상어 초등학교, 골드5

import Foundation

// 학생의 번호와 좋아하는 리스트를 담고 있는 StudentInfo 타입 정의
typealias StudentInfo = (num: Int, likeList: [Int])

let n = Int(readLine()!)!
let total = n*n
var map: [[StudentInfo]] = Array(repeating: Array(repeating: (-1, []), count: n), count: n) // 비어있으면 -1
var studentInfo: [StudentInfo] = []

for _ in 0..<total {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    let num = input[0]
    let likeList = input[1...4].map {Int(String($0))!}
    studentInfo.append((num, likeList))
}

// 상하좌우에 좋아하는 학생 수, 빈칸 수 리턴해주는 함수
func getPointInfo(y: Int, x: Int, info: (num: Int, likeList: [Int])) -> (likeCount: Int, emptyCount: Int) {
    let dx = [-1, 1, 0, 0]
    let dy = [0, 0, -1, 1]
    var likeCount = 0
    var emptyCount = 0
    for i in 0..<4 {
        let nx = x + dx[i]
        let ny = y + dy[i]
        // 범위안에 있으면
        if nx >= 0 && nx < n && ny >= 0 && ny < n {
            // 비어있으면
            if map[ny][nx].num == -1 {
                emptyCount += 1
            }
            else if info.likeList.contains(map[ny][nx].num) {
                likeCount += 1
            }
        }
    }
    return (likeCount, emptyCount)
}

// 학생들을 자리에 넣어주는 함수
func insertStudent(_ info: StudentInfo) {
    
    var likeCount = -1
    var emptyCount = -1
    var xPoint = 0; var yPoint = 0
    
    for y in 0..<n {
        for x in 0..<n {
            // 빈칸인 경우만 들어갈 수 있는 자리 (빈칸이 아니면 패스)
            if map[y][x].num != -1 {
                continue
            }
            let pointInfo = getPointInfo(y: y, x: x, info: info)
            // 좋아하는 학생수가 4명이면 바로 자리 차지하고 끝
            if pointInfo.likeCount == 4 {
                map[y][x] = info
                return
            }
            
            // 좋아하는 학생이 더 많을 경우
            if likeCount < pointInfo.likeCount {
                likeCount = pointInfo.likeCount
                emptyCount = pointInfo.emptyCount
                xPoint = x
                yPoint = y
            }
            
            // 좋아하는 학생 수는 같고 빈칸이 더 많을 경우
            else if likeCount == pointInfo.likeCount && emptyCount < pointInfo.emptyCount {
                likeCount = pointInfo.likeCount
                emptyCount = pointInfo.emptyCount
                xPoint = x
                yPoint = y
            }
        }
    }
    map[yPoint][xPoint] = info

}

// 총합 점수 리턴하는 함수
func getScore() -> Int {
    var score = 0
    for y in 0..<n {
        for x in 0..<n {
            let pointInfo = getPointInfo(y: y, x: x, info: map[y][x])
            switch pointInfo.likeCount {
            case 1:
                score += 1
            case 2:
                score += 10
            case 3:
                score += 100
            case 4:
                score += 1000
            default:
                break
            }
        }
    }
    return score
}

for info in studentInfo {
    insertStudent(info)
}

print(getScore())

