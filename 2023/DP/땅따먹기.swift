//
//  땅따먹기.swift
//  Algorithm
//
//  Created by 임영선 on 2023/10/13.
//

import Foundation

/*
 DFS로 모든 경우의 수를 구해서 합의 max를 구했다.
 테스트케이스 하나 맞고 나머지 시간초과..

 생각해보니 모든 케이스를 다 따질 필요가 없다.
 행하나당 max를 더해주기만 하면 된다.
 점진적으로 max들을 더하며 해결
 */

func solution(_ land:[[Int]]) -> Int{
    var land = land
    let n = land.count
    
    for i in 1..<n {
        land[i][0] += max(land[i-1][1], land[i-1][2], land[i-1][3])
        land[i][1] += max(land[i-1][0], land[i-1][2], land[i-1][3])
        land[i][2] += max(land[i-1][1], land[i-1][0], land[i-1][3])
        land[i][3] += max(land[i-1][1], land[i-1][2], land[i-1][0])
    }
    return max(land[n-1][0], land[n-1][1], land[n-1][2], land[n-1][3])
}

// DFS -> 시간초과
func solution(_ land:[[Int]]) -> Int{

    var answer = 0

    func DFS(result: Int, depth: Int, selectedIndex: Int) {
        if depth == land.count {
            answer = max(answer, result)
        }
        else {
            for i in 0..<4 {
                if i != selectedIndex {
                    DFS(result: result+land[depth][i], depth: depth+1, selectedIndex: i)
                }
            }
        }
    }

    for i in 0..<4 {
        DFS(result: land[0][i], depth: 1, selectedIndex: i)
    }

    return answer
}

print(solution([[1,2,3,5],[5,6,7,8],[4,3,2,1]]))

