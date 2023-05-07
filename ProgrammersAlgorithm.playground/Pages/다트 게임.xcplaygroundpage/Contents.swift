
//:> 2018 KAKAO BLIND RECRUITMENT 다트게임
/*:>
Lv.1
 */

import Foundation

////: 🌱solutionA (75%)
func solutionA(_ dartResult:String) -> Int {
    enum SquareOption: String{
        case S = "S"
        case D = "D"
        case T = "T"
        
        var square: Int{
            switch self{
            case .S:
                return 1
            case .D:
                return 2
            case .T:
                return 3
            }
        }
    }
    enum AwardOption: String{
        case star = "*"
        case achar = "#"
    }

    var primaryScore = 0
    var currentInt = ""
    var currentScore = 0
    var totalScore = 0
    
    for s in dartResult.enumerated(){
        let str = s.element.description
        
        if let _ = Int(str){
            currentInt += str
            print("str\(str)")
            if currentInt.count > 1{
                totalScore -= currentScore
            }else{
                totalScore += currentScore
                primaryScore = currentScore
            }
            
            print("primary total \(totalScore)")
            currentScore = Int(currentInt) ?? 0
        }
        
        if let squareScore = SquareOption(rawValue: str){
            print("currentScore \(currentScore) square \(squareScore)")
            currentScore = Int(pow(Float(currentScore), Float(squareScore.square)))
            currentInt = ""
        }
        
        if let awardScore = AwardOption(rawValue: str){
            switch awardScore{
            case .star:
                
                currentScore = currentScore*2 + primaryScore
                print("\(str)은 스타상 \(currentScore)")
                break
            case .achar:
                currentScore = -(currentScore)
                print("\(str)은 아차상 \(currentScore)")
                break
            }
        }
    }
    
    print("total : \(totalScore) + \(currentScore)")
    totalScore += currentScore
    return totalScore
}

//print(solutionA("1S2D*3T"))
//print(solutionA("1D2S#10S"))
//print(solutionA("1D2S0T"))

////: 🌱solutionB (100%)
// 블로그 참고 .split(whereSeparator:) 함수!!
func solutionB(_ dartResult:String) -> Int {
    
    enum SquareOption: String{
        case S = "S"
        case D = "D"
        case T = "T"
        
        var square: Int{
            switch self{
            case .S:
                return 1
            case .D:
                return 2
            case .T:
                return 3
            }
        }
    }
    enum AwardOption: String{
        case star = "*"
        case achar = "#"
    }
    
    
    
    var numbers = dartResult.split(whereSeparator: {$0.isLetter || $0 == "*" || $0 == "#"})
    var options = dartResult.split(whereSeparator: {$0.isNumber})
    var results: [Int] = []
//    print(numbers)
//    print(options)
    
    for (i, num) in numbers.enumerated(){
        let option = options[i].description
        
//        print("option \(option)")
        
        let squareOpt = SquareOption(rawValue: String(option.prefix(1)))
        let awardOpt = AwardOption(rawValue: String(option.suffix(1)))
        print(" num \(num) squareOpt \(squareOpt?.rawValue) awardOpt \(awardOpt?.rawValue)")
        
        switch awardOpt {
        case .star:
            results.append(Int(pow(Float(num)!, Float(squareOpt?.square ?? 1))) * 2)
            
            if i > 0{
                results[i-1] *= 2
            }
            break
        case .achar:
            results.append(Int(pow(Float(num)!, Float(squareOpt?.square ?? 1))) * -1)
            break
        default:
            print("no award")
            results.append(Int(pow(Float(num)!, Float(squareOpt?.square ?? 1))))
            break
        }
    }
    print("results \(results)")
    
        
    return results.reduce(0, +)
}
//print(solutionB("1S2D*3T"))
print(solutionB("1T2D3D#"))
//print(solutionB("1S2D*3T"))

​
