//
//  BOJ_2468.swift
//  Algorithm
//
//  Created by 임영선 on 2022/08/14.
//  BOJ 2468 - 안전영역 : DFS
import Foundation

let n = Int(readLine()!)!
var area = [[Int]]()
var heights = [Int]()

for _ in 0..<n {
    area.append(readLine()!.split(separator: " ").map({Int(String($0))!}))
    for i in 0..<n {
        // 높이들을 중복없이 저장
        if !heights.contains(area[area.count-1][i]) { heights.append(area[area.count-1][i]) }
    }
}

heights.sort() // heights 오름차순 정렬

var count = 0
var max = 1
let area_fix = area

// dfs 함수
func dfs(_ x: Int, _ y: Int, _ now_h: Int) {
    if x < 0 || y < 0 || x >= n || y >= n || area[x][y] <= now_h { return } // 예외
    
    area[x][y] = now_h // 이미 체크한 자리는 현재 비의 높이와 동일하게 바꿔주기
    
    // 재귀 호출
    dfs(x+1, y, now_h)
    dfs(x-1, y, now_h)
    dfs(x, y+1, now_h)
    dfs(x, y-1, now_h)
}

// 메인 실행문
for i in heights {
    let h = i // 현재 반복에서 확인할 비의 높이
    
    for x in 0..<n {
        for y in 0..<n {
            if area[x][y] > h { // 현재 지점이 비의 높이보다 높을 경우
                count += 1
                dfs(x, y, h)
            }
        }
    }
    
    if max < count { max = count }
    count = 0
    area = area_fix
}

print(max)

