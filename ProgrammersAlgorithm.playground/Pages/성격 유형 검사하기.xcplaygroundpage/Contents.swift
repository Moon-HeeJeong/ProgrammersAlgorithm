//:> 2022 KAKAO TECH INTERNSHIP 성격 유형 검사하기
/*:>
Lv.1
 */

import Foundation

func solution(_ survey:[String], _ choices:[Int]) -> String {
    enum AgreeGrade: Int{
        case bigDisagree = 1
        case disagree = 2
        case smallDisagree = 3
        case idk = 4
        case smallAgree = 5
        case agree = 6
        case bigAgree = 7
        
        var isAgree: Bool?{
            switch self{
            case .bigAgree, .agree, .smallAgree:
                return true
            case .bigDisagree, .disagree, .smallDisagree:
                return false
            case .idk:
                return nil
            }
        }
        
        var point: Int{
            switch self{
            case .bigAgree, .bigDisagree:
                return 3
            case .agree, .disagree:
                return 2
            case .smallAgree, .smallDisagree:
                return 1
            case .idk:
                return 0
            }
        }
    }
    
    var indicatorGroup:[String:Int] = ["R":0, "T":0, "C":0, "F":0, "J":0, "M":0, "A":0, "N":0]
    var result: String = ""
    
    
    for i in 0..<choices.count{
        let grade: AgreeGrade = AgreeGrade(rawValue: choices[i]) ?? .idk
        let group = survey[i]
        
        if let isAgree = grade.isAgree{
            if isAgree{
                indicatorGroup[group.last!.description]! += grade.point
            }else{
                indicatorGroup[group.first!.description]! += grade.point
            }
        }
    }
    
    if indicatorGroup["R"]! >= indicatorGroup["T"]!{
        result += "R"
    }else{
        result += "T"
    }
    
    if indicatorGroup["C"]! >= indicatorGroup["F"]!{
        result += "C"
    }else{
        result += "F"
    }
    
    if indicatorGroup["J"]! >= indicatorGroup["M"]!{
        result += "J"
    }else{
        result += "M"
    }
    
    if indicatorGroup["A"]! >= indicatorGroup["N"]!{
        result += "A"
    }else{
        result += "N"
    }
    
    print("indicatorGroup \(indicatorGroup) result \(result)")
    
    
    return result
}
//print(solution(["AN", "CF", "MJ", "RT", "NA"], [5, 3, 2, 7, 5]))
print(solution(["TR", "RT", "TR"], [7, 1, 3]))
