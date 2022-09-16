//
//  programmers_118666.swift
//  Algorithm
//
//  Created by 임영선 on 2022/09/16.
//  Programmers 118666 - 성격유형검사하기 : 구현
import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
  var characterDict: [String: Int] = ["R": 0, "T": 0, "C": 0, "F": 0, "J": 0, "M": 0, "A": 0, "N": 0]
  for i in 0..<survey.count {
    let (disagree, agree) = (String(survey[i].first!), String(survey[i].last!))
    for (key, _) in characterDict {
      // 동의
      if choices[i] > 4 && key == agree {
        characterDict[key]! += choices[i] - 4
      }
      
      // 비동의
      if choices[i] < 4 && key == disagree {
        characterDict[key]! += 4 - choices[i]
      }
    }
  }
  var answer = ""
  characterDict["R"]! >= characterDict["T"]! ? answer.append("R") : answer.append("T")
  characterDict["C"]! >= characterDict["F"]! ? answer.append("C") : answer.append("F")
  characterDict["J"]! >= characterDict["M"]! ? answer.append("J") : answer.append("M")
  characterDict["A"]! >= characterDict["N"]! ? answer.append("A") : answer.append("N")
  
  return answer
}
