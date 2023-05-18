//
//  programmers_155651.swift
//  Algorithm
//
//  Created by 임영선 on 2023/05/18.
//  programmers 155651 - 호텔 대실 : 구현

import Foundation

func solution(_ book_time:[[String]]) -> Int {
    var answer = 0
    let bookTime = book_time.sorted(by: {$0[0] < $1[0]})
    var bookNum = Array(repeating: 0, count: bookTime.count) // 객실번호 할당
   
    let bookTimeToMinutes = timeToMinutes(bookTime)
    var endTime = 0
    
    for i in 0..<bookTimeToMinutes.count {
        // 객실번호가 할당되지 않았으면
        if bookNum[i] == 0 {
            answer += 1
            bookNum[i] = answer
            endTime = bookTimeToMinutes[i][1]+10
        }
        // 이미 할당된 객실이면 패스
        else {
            continue
        }
        for j in i+1..<bookTimeToMinutes.count {
            // 그 예약의 객실이 할당되지 않았고 && 현재 객실이 끝나는 시간 이후에 사용할 수 있다면
            if bookNum[j] == 0 && endTime <= bookTimeToMinutes[j][0] {
                bookNum[j] = answer
                endTime = bookTimeToMinutes[j][1]+10
            }
        }
    }
    return answer
    
   
    
}

// 분으로 계산하는 메소드 ex) 10:10 -> 10*60 + 10 = 610
func timeToMinutes(_ bookTime: [[String]]) -> [[Int]] {
    var minutesArray = [[Int]]()
    for times in bookTime {
        var arr = [Int]()
        for time in times {
            let split = time.split(separator: ":").map {Int(String($0))!}
            arr.append(split[0]*60 + split[1])
        }
        minutesArray.append(arr)
    }
   return minutesArray
}


let arr = [["15:00", "17:00"], ["16:40", "18:20"], ["14:20", "15:20"], ["14:10", "19:20"], ["18:20", "21:20"]]
print(solution(arr))
