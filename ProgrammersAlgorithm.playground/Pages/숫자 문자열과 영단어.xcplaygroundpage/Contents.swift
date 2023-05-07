
//:> 2021 카카오 채용연계형 인턴십 숫자 문자열과 영단어
/*:>
Lv.1
 */

import Foundation

////: 🌱solutionA (100%)
//너무 쉽나... 다른풀이없나...
func getNumByAlphabet(alphabet: String?)->String?{
    switch alphabet{
    case "zero":
        return "0"
    case "one":
        return "1"
    case "two":
        return "2"
    case "three":
        return "3"
    case "four":
        return "4"
    case "five":
        return "5"
    case "six":
        return "6"
    case "seven":
        return "7"
    case "eight":
        return "8"
    case "nine":
        return "9"
    default:
        return nil
    }
}

func solutionA(_ s:String) -> Int {
    
    var numResult: String = ""
    var currentAlphabet: String = ""
    
    for str in s.enumerated(){
        
        let strValue = str.element.description
        
        
        if let _ = Int(strValue){
            numResult += strValue
        }else{
            currentAlphabet += strValue
            
            if let num = getNumByAlphabet(alphabet: currentAlphabet){
                numResult += num
                currentAlphabet = ""
            }
        }
    }
    return Int(numResult) ?? 0
}
//print(solutionA("one4seveneight"))

////: 🌱solutionB (100%)
//이런 풀이가 있다 대체하는 함수 replacingOccurrences
func solutionB(_ s:String) -> Int {

    let alphabetDct = ["zero": "0", "one": "1", "two": "2",
                       "three": "3", "four": "4", "five": "5",
                       "six": "6", "seven": "7", "eight": "8", "nine": "9"]
    
    var str = s
    for i in alphabetDct{
        str = str.replacingOccurrences(of: i.key, with: i.value)
    }
    return Int(str) ?? 0
}
print(solutionB("one4seveneight"))

​
