//:> 연습문제 옹알이(2)
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA
// replacing, replacingOccurrences 함수 사용이 안됨...
func solutionA(_ babbling:[String]) -> Int {
    
    var bab = babbling
    let canPronounceWords = ["aya", "ye", "woo", "ma"]
    
    for i in 0..<bab.count{
        
        for j in 0..<canPronounceWords.count{
            if bab[i].contains(canPronounceWords[j]){
//                bab[i] = bab[i].replacing(canPronounceWords[j], with: "", maxReplacements: 1)
                bab[i] = bab[i].replacingOccurrences(of: canPronounceWords[j], with: "")
            }
        }
        
        print("result \(i) babbling \(bab[i])")
    }
    
    return bab.filter({$0.isEmpty}).count
}
//print(solutionA(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
//print(solutionA(["aya", "yee", "u", "maa"]))

//: 🌱solutionB(55%)
//반례는 yeye 처럼 연속된 발음은 못하지만 yeaye 처럼 연속되지 않으면 발음할 수 있다는 것
//ranges 함수도 사용이 안된다... 왜 안되지..... range는 된다
func solutionB(_ babbling:[String]) -> Int {
    
    var bab = babbling
    let canPronounceWords = ["aya", "ye", "woo", "ma"]
    
    for i in 0..<bab.count{
        
        for j in 0..<canPronounceWords.count{
            if bab[i].contains(canPronounceWords[j]){
                let range = bab[i].range(of: canPronounceWords[j])// ranges(of: canPronounceWords[j])
                bab[i] = bab[i].replacingCharacters(in: range!, with: "")
            }
        }
        print("result \(i) babbling \(bab[i])")
    }
    
    return bab.filter({$0.isEmpty}).count
}
//print(solutionB(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))

//: 🌱solutionC(100%)
//블로그 참고. 해당되는 단어를 숫자로 바꿔 연속되는 경우 11 22 로 체크한다
func solutionC(_ babbling:[String]) -> Int {
    
    var bab:[String] = babbling
    let canPronounceWords = ["aya", "ye", "woo", "ma"]
    var canSpeakCnt = 0
    
    for i in 0..<bab.count{
        
        for j in 0..<canPronounceWords.count{
            if bab[i].contains(canPronounceWords[j]){
                bab[i] = bab[i].replacingOccurrences(of: canPronounceWords[j], with: "\(j)")
            }
        }
        
        //if Int(bab[i])와 if !bab[i].contains("00")  두 if 문의 순서가 바뀌면 몇 개가 타임아웃이 된다. Int 체크 후 contains 확인할 것.
        if let _ = Int(bab[i]){
            if !bab[i].contains("00") && !bab[i].contains("11") && !bab[i].contains("22") && !bab[i].contains("33"){
                canSpeakCnt += 1
            }
        }
        print("result \(i) babbling \(bab[i])")
    }
    
    return canSpeakCnt
}
//print(solutionC(["aya", "yee", "u", "maa"]))
print(solutionC(["ayaye", "uuu", "yeye", "yemawoo", "ayaayaa"]))
