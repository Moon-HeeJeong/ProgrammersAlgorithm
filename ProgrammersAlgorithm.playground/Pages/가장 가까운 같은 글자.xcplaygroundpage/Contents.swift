//:> 연습문제 가장 가까운 같은 글자
/*:>
Lv.1
 */

import Foundation

//: 🌱solution (100%)
//10분컷~
func solution(_ s:String) -> [Int] {
    
    var alphabetPos: [String:Int] = [:]
    var closePos: [Int] = []
    
    for (i, str) in s.enumerated(){
        
        if let closeValue = alphabetPos[str.description]{
            print("exist value \(str.description) at \(i - closeValue)")
            closePos.append(i - closeValue)
        }else{
            print("not exist value \(str.description)")
            closePos.append(-1)
            alphabetPos[str.description] = i
        }
    }
    
    print("closePos \(closePos)")
    
    return []
}
print(solution("banana"))
