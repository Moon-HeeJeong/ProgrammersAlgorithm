//:> 2022 KAKAO BLIND RECRUITMENT 주차 요금 계산
/*:>
 Lv.2
 */

import Foundation

//: 🌱solution (100%)
func solution(_ fees:[Int], _ records:[String]) -> [Int] {
    
    let basicTime = fees[0]
    let basicFee = fees[1]
    let addedMeasure = fees[2]
    let addedFee = fees[3]
    
    var carNums = Set<String>()
    var inTime: [String:[String]] = [:]
    var outTime: [String:[String]] = [:]
    var usingTime: [String:Int] = [:] //차 번호 : 이용시간(분)
    
    var calcuratingFee:[Int] = []
    
    for record in records {
        var recordData = record.split(separator: " ")
        
        let carNum = recordData[1].description
        let time = recordData[0].description
        
        carNums.insert(carNum)
        
        if recordData[2] == "IN"{
            if inTime[carNum] == nil{
                inTime[carNum] = []
            }
            inTime[carNum]!.append(time)
        }else{
            if outTime[carNum] == nil{
                outTime[carNum] = []
            }
            outTime[carNum]!.append(time)
        }
        
    }
    
    var carNumsArr: [String] = Array(carNums).sorted(by: <)
    
    for i in 0..<carNumsArr.count{
        
        let carNum = carNumsArr[i]
        let inCnt = (inTime[carNum]?.count)!
        
        for j in 0..<inCnt{
            let inStr = inTime[carNum]![j]
            let outStr = (outTime[carNum]?.count ?? 0) > j ? outTime[carNum]![j] : "23:59"
            
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            
            let inTime = formatter.date(from: inStr)
            let outTime = formatter.date(from: outStr)
        
            let timeMargin = Int(ceil((outTime?.timeIntervalSince(inTime!))!/60))
            
//            if let _ = usingTime[carNum]{
//                usingTime[carNum]! += timeMargin
//            }else{
//                usingTime[carNum] = timeMargin
//            }
            usingTime[carNum, default: 0] += timeMargin
        }
    }
    
    //돈계산
    for i in 0..<usingTime.count{
        let carNum = carNumsArr[i]
        let usingTime = usingTime[carNum]!
        
        if usingTime <= basicTime{ //기본시간 이하 사용
            calcuratingFee.append(basicFee)
        }else{ // 기본시간 이상 사용
            let exceedTime = usingTime - basicTime
            let exceedFee = Int(ceil(Double(exceedTime)/Double(addedMeasure)))*addedFee
            calcuratingFee.append(exceedFee+basicFee)
        }
    }
    print(":::: calcuratingFee \(calcuratingFee)")
    
    return calcuratingFee
}
//print(solution([180, 5000, 10, 600], ["05:34 5961 IN", "06:00 0000 IN", "06:34 0000 OUT", "07:59 5961 OUT", "07:59 0148 IN", "18:59 0000 IN", "19:09 0148 OUT", "22:59 5961 IN", "23:00 5961 OUT"]))
//print(solution([120, 0, 60, 591], ["16:00 3961 IN","16:00 0202 IN","18:00 3961 OUT","18:00 0202 OUT","23:58 3961 IN"]))
print(solution([1, 461, 1, 10], ["00:00 1234 IN"]))


/**
 다른 사람 풀이보니까 timeStr을 굳이 dateFomatter해서 분으로 바꾼다음 쓰지 않고
 String 상태에서 : 로 split 하고
 let hour = Int(separatedTime.first ?? "0") ?? 0
 let minute = Int(separatedTime.last ?? "0") ?? 0
 return hour * 60 + minute
 하는 식으로 했다..!
 이러면 minute을 따로 더하니까 올림 안해도 됨
 
 **/
