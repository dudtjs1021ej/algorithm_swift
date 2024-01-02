//
//  주차 요금 계산하기.swift
//  Algorithm
//
//  Created by 임영선 on 2023/11/03.
//

import Foundation

func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    // 시간을 분으로 바꿔주는 메소드 ex) 01:10 -> 70
    func timeToMinute(_ time: String) -> Int {
        let split = time.split(separator: ":").map {Int(String($0))!}
        return 60*split[0] + split[1]
    }
    
    // [차번호: (나갔는지, 사용시간)]
    var dict: [Int: (isOut: Bool, time: Int)] = [:]
    
    for record in records {
        let split = record.split(separator: " ").map {String($0)}
        let time = split[0]
        let carNumber = Int(split[1])!
        
        // 차가 들어오면
        if split[2] == "IN" {
            if dict[carNumber] == nil {
                dict[carNumber] = (false, timeToMinute(time))
            }
            else {
                let usageTime = dict[carNumber]!.time + timeToMinute(time)
                dict[carNumber] = (false, usageTime)
            }
        }
        
        // 차가 나가면 isOut true로 변경
        else if split[2] == "OUT" {
            let usageTime =  dict[carNumber]!.time - timeToMinute(time)
            dict[carNumber] = (true, usageTime)
        }
    }
    
    // 아직 안나간 차가 있다면 23:59분에 나갔다고 가정
    for (key, value) in dict {
        if !dict[key]!.isOut {
            let usageTime = dict[key]!.time - timeToMinute("23:59")
            dict[key] = (false, usageTime)
        }
    }
    
    // 차 번호 기준으로 오름차순 정렬
    let dictSorted = dict.sorted { $0.key < $1.key }
    var answer: [Int] = []
    
    for (key, value) in dictSorted {
        let time = value.time*(-1)
        
        // 기본 시간을 넘기지 않았으면 기본 요금만
        if time <= fees[0] {
            answer.append(fees[1])
        }
        
        // 기본 시간을 넘겼다면
        else {
            let c = ceil((Float(time)-Float(fees[0])) / Float(fees[2]))
            let money = fees[1] + Int(c)*fees[3]
            answer.append(money)
        }
    }
    return answer
}
