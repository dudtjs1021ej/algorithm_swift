//
//  택배배달 수거하기.swift
//  Algorithm
//
//  Created by 임영선 on 2023/10/28.
//

import Foundation

func solution(_ cap:Int, _ n:Int, _ deliveries:[Int], _ pickups:[Int]) -> Int64 {
    var del = deliveries
    var pick = pickups
    var distance = 0
    
    // 뒤에서 택배 개수가 0이면 다 제거
    while !del.isEmpty {
        let num = del.popLast()!
        if num != 0 {
            del.append(num)
            break
        }
    }
    
    while !pick.isEmpty {
        let num = pick.popLast()!
        if num != 0 {
            pick.append(num)
            break
        }
    }
    
    while true {
        // 남은 택배가 없으면 break
        if del.isEmpty && pick.isEmpty {
            break
        }
    
        // 가장 먼 곳에서 왕복 -> *2
        distance += max(del.count, pick.count)*2
        
        // 택배 배달
        var count = cap
        while !del.isEmpty {
            let num = del.popLast()!
            
            // 0이면 패스
            if num == 0 {
                continue
            }
            // cap을 넘어가면 break
            else if count < num {
                del.append(num-count)
                break
            }
            else {
                count -= num
            }
        }
        
        // 택배 수거
        count = 0
        while !pick.isEmpty {
            let num = pick.popLast()!
            
            if num == 0 {
                continue
            }
            // cap을 넘어가면 break
            else if count+num > cap {
                pick.append(num-(cap-count))
                break
            }
            else {
                count += num
            }
        }
    }
    
    return Int64(distance)
}
