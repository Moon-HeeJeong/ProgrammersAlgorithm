//:> 2021 KAKAO BLIND RECRUITMENT 신규 아이디 추천
/*:>
Lv.1
 */

import Foundation

////: 🌱solution (100%)
func solution(_ new_id:String) -> String {
    
    //new_id : 소문자, 숫자, -, _, .
    
    var editingStr: String = ""
    
    //1단계 대문자를 소문자로
    editingStr = new_id.lowercased()
    print("lower ::: \(editingStr)")
    
    //2단계 특수문자 제거. 알파벳 소문자, 숫자, 빼기(-), 밑줄(_), 마침표(.)만 남기기
    editingStr = editingStr.filter { str in
        if str.isLetter || str.isNumber || str == "-" || str == "_" || str == "."{
            return true
        }else{
            return false
        }
    }
    
    print("specialCharId ::: \(editingStr)")
    
    //3단계 .이 두개 이상인 경우 .로 치환
    
    var isReplacing: Bool = true
    
    
    while isReplacing{
        let beforeStr = editingStr
        let afterStr = beforeStr.replacingOccurrences(of: "..", with: ".")
        
        if beforeStr == afterStr{
            isReplacing = false
        }
        editingStr = afterStr
    }
    
    print("dotCharId ::: \(editingStr)")
    
    //4단계 .이 처음이나 마지막에 위치하면 제거
    editingStr = {
        var char = editingStr
        if char.first == "."{
            char.removeFirst()
        }
        if char.last == "."{
            char.removeLast()
        }
        return char
    }()
    print("endDot ::: \(editingStr)")
    
    //5단계. 빈 문자열이라면 a 대입
    if editingStr.isEmpty{
        editingStr = "a"
        
        print("empty char ::: \(editingStr)")
    }
    
    //6단계. 15개 이상의 문자 제거
    if editingStr.count > 15{
        print("editingStr Count :::: \(editingStr.count)")
        
        let range: Range<String.Index> = editingStr.index(editingStr.endIndex, offsetBy: 15 - editingStr.count)..<editingStr.endIndex
        editingStr.removeSubrange(range)
        
        if editingStr.last == "."{
            editingStr.removeLast()
        }
        
        print("15 over char remove ::: \(editingStr)")
    }
    
    //7단계. 2개 이하의 문자 늘리기
    if editingStr.count <= 2{
        for _ in 0..<(2 - editingStr.count+1){
            editingStr += editingStr.last?.description ?? ""
        }
        
        print("expand 2 under string ::: \(editingStr)")
    }
    
    return editingStr
}
print(solution("...!@BaT#*..y.abcdefghijklm"))
//print(solution("z-+.^."))

//이런 코드들로 바꿔볼 수 있겠다
func reference(){
    var id = ""
    
    while id.contains("..") {
        id = id.replacingOccurrences(of: "..", with: ".")
    }
    
    while id.hasPrefix(".") {
        id.removeFirst()
    }
    
    while id.hasSuffix(".") {
        id.removeLast()
    }
}
