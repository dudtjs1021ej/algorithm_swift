//
//  BOJ_20057.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/16.
//

// https://www.acmicpc.net/problem/20057
// 마법사 상어와 토네이도

import Foundation

let n = Int(readLine()!)!
var map: [[Int]] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map {Int(String($0))!}
    map.append(input)
}

// 초기 좌표는 가운데
var currentPoint: (x: Int, y: Int) = (Int(n/2), Int(n/2))

enum Direct: Int {
    case left
    case right
    case up
    case down
    
    // 방향대로 이동할 때 x,y 좌표 리턴
    var movedPoint: (x: Int, y: Int) {
        switch self {
        case .left:
            return (currentPoint.x-1, currentPoint.y)
        case .right:
            return (currentPoint.x+1, currentPoint.y)
        case .up:
            return (currentPoint.x, currentPoint.y-1)
        case .down:
            return (currentPoint.x, currentPoint.y+1)
        }
    }
    
    // 방향에 따른 x,y좌표, 퍼센트를 담은 ratios
    var ratios: [(y: Int, x: Int, percent: Int)] {
        switch self {
        case .left:
            return [
                (-2, 0, 2), (-1, -1, 10), (-1, 0, 7), (-1, 1, 1), (0, -2, 5), (1, -1, 10), (1, 0, 7), (1, 1, 1), (2, 0, 2), (0, -1, 0)
            ]
        case .down:
            return [
                (2, 0, 5), (1, -1, 10), (1, 1, 10), (0, -2, 2), (0, -1, 7), (0, 1, 7), (0, 2, 2), (-1, 1, 1), (-1, -1, 1), (1, 0, 0)
            ]
        case .up:
            return [
                (-2, 0, 5), (-1, 1, 10), (-1, -1, 10), (0, 2, 2), (0, 1, 7), (0, -1, 7), (0, -2, 2), (1, -1, 1), (1, 1, 1), (-1, 0, 0)
            ]
        case .right:
            return [
                (2, 0, 2), (1, 1, 10), (1, 0, 7), (1, -1, 1), (0, 2, 5), (-1, 1, 10), (-1, 0, 7), (-1, -1, 1), (-2, 0, 2), (0, 1, 0)
            ]
        }
    }
    
}

var answer = 0

func move(_ direct: Direct, _ count: Int) {
    let ratios = direct.ratios
    for _ in 0..<count {
        let movePoint = direct.movedPoint

        // y의 좌표가 범위에 있으면
        if (movePoint.x >= 0 && movePoint.y >= 0 && movePoint.x < n && movePoint.y < n) {
            currentPoint = movePoint
            let sand = map[currentPoint.y][currentPoint.x]
            var spreadSand = sand
            map[currentPoint.y][currentPoint.x] = 0
            
            // 모래양이 0이면 넘어감
            if sand == 0 {
                continue
            }
            
            // 모래양이 10 이상일 때만 비율 계산
            else if sand >= 10 {
                for i in 0..<9 {
                    let nx = currentPoint.x + ratios[i].x
                    let ny = currentPoint.y + ratios[i].y
                    
                    // 모래양 비율 계산해서 뿌리고 남은 모래에서 뺌
                    let num = Int(Double(sand)*Double(ratios[i].percent)*0.01)
                    spreadSand -= num
                    
                    // 범위에서 벗어나지 않았다면 해당 칸에 더한다.
                    if nx >= 0 && ny >= 0 && nx < n && ny < n {
                        map[ny][nx] += num
                    }
                    // 범위에서 벗어났다면 답에 더한다.
                    else {
                        answer += num
                    }
                }
                let ay = currentPoint.y + ratios[9].y
                let ax = currentPoint.x + ratios[9].x
                // a좌표가 범위안에 있다면 남은 모래를 더한다.
                if ax >= 0 && ay >= 0 && ax < n && ay < n {
                    map[ay][ax] += spreadSand
                }
                
                // 범위를 벗어났다면 답에 더한다.
                else {
                    answer += spreadSand
                }
            }
            
            // 모래양이 10 미만이면 a에 다 뿌려짐
            else {
                let ay = currentPoint.y + ratios[9].y
                let ax = currentPoint.x + ratios[9].x
    
                if ax >= 0 && ay >= 0 && ax < n && ay < n {
                    map[ay][ax] += spreadSand
                }
                
                // 범위를 벗어났다면 답에 더한다.
                else {
                    answer += spreadSand
                }
            }
            
        }
    }
    
}

var moveCount = 1
// 토네이도 이동 규칙 -> 왼1 아1 오2 위2 왼3 아3 오4 위4 ..
while true {
    // n이랑 같으면 left 한 번 실행하고 끝
    if moveCount == n {
        move(.left, moveCount)
        break
    }
    
    // moveCount가 홀수면 left, down
    if moveCount % 2 == 1 {
        move(.left, moveCount)
        move(.down, moveCount)
    }
    // moveCount가 짝수면 right, up
    else {
        move(.right, moveCount)
        move(.up, moveCount)
    }
    // 움직임수 +1
    moveCount += 1
}

print(answer)


