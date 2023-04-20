//:> 비밀지도
/*:>
Lv.1
 */

import Foundation

//: 🌱solution (%)
//비트연산으로 UInt 변경하다가 스탑... 담에 다시 해주기..
func solution(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
//    var mapOneValue: [String] = arr1.map({String($0, radix: 2)})
    
    //1. set binary value
    var mapOneValue: [String] = toBinary(value: arr1)
    var mapTwoValue: [String] = toBinary(value: arr2)
    var sumValue: [UInt] = []
    
    print("mapOne :: \(mapOneValue)")
    print("mapTwo :: \(mapTwoValue)")
    
    func toBinary(value: [Int]) -> [String]{
        value.map { value in
            var binaryValue = String(value, radix: 2)
            while binaryValue.count < n{
                binaryValue = "0" + binaryValue
            }
            return binaryValue
//            return UInt("0b"+binaryValue) ?? UInt(0)
        }
    }
    
    
    //2. sum map
    for i in 0..<mapOneValue.count{
        let one:UInt = UInt(mapOneValue[i]) ?? UInt(0) //Unit(symbol: mapOneValue[i])
        let two:UInt = UInt(mapTwoValue[i]) ?? UInt(0)//Unit(symbol: mapTwoValue[i])
        
        print("one \(one) two \(two)")
        let operatedValue = one | two
        sumValue.append(operatedValue)
    }
//
    print("sum \(sumValue)")
    
    return answer
}

//: 🌱solutionA (100%)
//하나하나 나눠주는 방법~
func solutionB(_ n:Int, _ arr1:[Int], _ arr2:[Int]) -> [String] {
    var answer: [String] = []
    
    for i in 0..<n{
        var firstValue: Int = arr1[i]
        var secondValue: Int = arr2[i]
        
        var sumBinary: String = ""
        
        for _ in 0..<n{
            
            let firstLeftBinary = firstValue % 2
            let secondLeftBinary = secondValue % 2
            
            if firstLeftBinary == 0 && secondLeftBinary == 0{
                sumBinary = " "+sumBinary
            }else{
                sumBinary = "#"+sumBinary
                
            }
            
            firstValue /= 2
            secondValue /= 2
        }
        
        answer.append(sumBinary)
        
        print("\(i)번째 지도 \(sumBinary)")
    }
        
    return answer
}

print(solutionB(5, [9, 20, 28, 18, 11], [30, 1, 21, 17, 28]))
