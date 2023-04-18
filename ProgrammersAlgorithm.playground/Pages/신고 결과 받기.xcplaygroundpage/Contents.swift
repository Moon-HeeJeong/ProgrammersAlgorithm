
//:> 2022 KAKAO BLIND RECRUITMENT 신고 결과 받기
/*:>
Lv.1
 */


import Foundation
 
//: 🌱solutionA (16.7%)
//정확성: 16.7 실화일까...
func solutionA(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    //id_list : 이용자의 ID, 중복없음
    //report : "이용자id 신고한id" muzi -> frodo(신고당함) / 자기자신 신고불가 / 한 유저가 같은 유저를 여러번 신고하면 1개로 카운트됨
    //k : k만큼 신고당하면 정지
    
    var reportDct: [String:Set<String>] = [:] //신고 당한 사람 : 신고한 사람들
    var mailCountDct: [String:Int] = [:] //신고한 사람 : 받은 이메일 수
    var emailCountArr: [Int] = [] //각 유저가 받은 결과 메일 수
    
    //1. setting by id
    for i in 0..<id_list.count{
        reportDct[id_list[i]] = []
        mailCountDct[id_list[i]] = 0
    }
    
    for i in 0..<report.count{
        
        let reportArr = report[i].components(separatedBy: " ")
        let reporter = reportArr.first ?? "" //신고한 사람
        let reported = reportArr.last ?? "" //신고당한 사람
        
        reportDct[reported]?.insert(reporter)
        
        if reportDct[reported]?.count ?? 0 >= k{
            let array = Array(reportDct[reported] ?? Set<String>())
            for i in 0..<array.count{
                mailCountDct[array[i]]? += 1
            }
        }
    }
    
    
    for i in 0..<id_list.count{
        emailCountArr.append(mailCountDct[id_list[i]] ?? 0)
    }
    return emailCountArr //각 유저가 받는 결과 메일 수
}

//: 🌱solutionB (100%)
// 컨닝 좀 했다...
// 이게 왜 되는지는 알겠는데 solutionA가 왜 안되는지 모르겠다 ㅠ

func solutionB(_ id_list:[String], _ report:[String], _ k:Int) -> [Int] {
    
    var reportDct: [String:[String]] = [:] //신고한 사람 : 신고 당한 사람들
    var warnCountDct: [String:Int] = [:] //신고 당한 사람 : 받은 신고 수
    
    //1. setting by id
    for i in 0..<id_list.count{
        reportDct[id_list[i]] = []
        warnCountDct[id_list[i]] = 0
    }
    
    for r in Set(report){
        let reportArr = r.components(separatedBy: " ")
        let reporter = reportArr.first ?? "" //신고한 사람
        let reported = reportArr.last ?? "" //신고당한 사람
        
        reportDct[reporter]?.append(reported) //신고한 사람 dict에 신고 당한 사람들을 넣는다
        warnCountDct[reported] = (warnCountDct[reported] ?? 0) + 1 //신고 당한 사람의 신고 당한 카운트 증가
    }
    
    //map 사용!!!
    let emailCountArr:[Int] = id_list.map { key in
        var count = 0
        for r in reportDct[key] ?? [] { // r: key가 신고한 사람들
            count += (warnCountDct[r] ?? 0) >= k ? 1 : 0 // r이 받은 신고가 k 이상이면 key에게 메일 1회 전송
        }
        return count
    }
    return emailCountArr //각 유저가 받는 결과 메일 수
}


print(solutionB(["muzi", "frodo", "apeach", "neo"], ["muzi frodo","apeach frodo","frodo neo","muzi neo","apeach muzi"], 2))

