//:> 2023 KAKAO BLIND RECRUITMENT 개인정보 수집 유효기간
/*:>
Lv.1
 */


import UIKit

//: 🌱solution (100%)
// 날짜 바꾸는 부분은 블로그 참고했다(월이 28일로 이루어져있음)

func solution(_ today:String, _ terms:[String], _ privacies:[String]) -> [Int] {
    
    //today:
    //term: "약관종류(알파벳) 유효기간(정수)"
    //privacies: "날짜 약관종류"
    
    //날짜 직접계산
    let todayDays = getDays(strOfDate: today)
    var privaciesTerms: [String:Int] = [:] //약관종류:유효기간
    var gatheredPrivacies: [Int:Int] = [:] //개인정보 번호:파기하는 날 ('일' 수 로 계산)
    var expiredPrivaciesIdx: [Int] = [] // 파기해야할 개인 정보 번호
    
    print("today\(today) days \(todayDays)")
    for term in terms {
        let termArray = term.components(separatedBy: " ")
        privaciesTerms[termArray.first ?? ""] = Int(termArray.last ?? "0")
    }
    
    for i in 0..<privacies.count {
        
        let privacyArray = privacies[i].components(separatedBy: " ")
        let gatheredDays = privacyArray.first ?? "" //수집한 날짜
        
        let privacyKind = privacyArray.last ?? ""
        let expirationMonth = privaciesTerms[privacyKind] ?? 0
        
        let expireDays = getDays(strOfDate: gatheredDays) + getDays(month: expirationMonth)
        print("privacy No.\(i+1) \(privacies[i]) -> gatheredDays \(gatheredDays) expireDays \(expireDays)")
        
        gatheredPrivacies[i+1] = expireDays
    }
    
    print("gathered info \(gatheredPrivacies)")
    
    expiredPrivaciesIdx = gatheredPrivacies.filter({ element in
        element.value <= todayDays
    }).keys.sorted(by: <)
    
    return expiredPrivaciesIdx
}



// '년', '월', '일' 을 다 '일'로 바꿔준다
func getDays(strOfDate: String) -> Int{
    let date = strOfDate.components(separatedBy: ".")
    let year = Int(date[0]) ?? 0
    let month = Int(date[1]) ?? 0
    let day = Int(date[2]) ?? 0
    return ((year*(28*12)) + (month*28) + day)
}

func getDays(month: Int) -> Int{
    return month*28
}

print(solution("2022.05.19", ["A 6", "B 12", "C 3"], ["2021.05.02 A", "2021.07.01 B", "2022.02.19 C", "2022.02.20 C"]))

//1: 2021년 11월 1일까지 보관
//2: 2022년 6월 28일까지 보관
//3: 2022년 5월 18일까지 보관
//4: 2022년 5월 19일까지 보관
