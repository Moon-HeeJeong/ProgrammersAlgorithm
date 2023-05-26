//:> 연습문제 명예의 전당 (1)
/*:>
Lv.1
 */

//: 🌱solution (100%)
//firstIndex는 for 문을 돌아서 이중 for 문이 되기 때문에 시간초과에 걸릴 수도 있다..! 사용 주의
func solution(_ k:Int, _ score:[Int]) -> [Int] {
    
    var honorZone: [Int] = []
    var announceScore: [Int] = []
    
    for i in 0..<score.count{
        
        if i < k{ //k번째 까지는 다 명예의 전당으로 간다
            honorZone.append(score[i])
        }else{
            if honorZone.min()! < score[i]{ //명예의 전당에 있는 값보다 큰 값이 나오면
                let minIdx = honorZone.firstIndex(of: honorZone.min()!)
                honorZone.remove(at: minIdx!)
                honorZone.append(score[i])
            }
        }
        
        print("honerZone \(honorZone) and min value is \(honorZone.min()!)")
        announceScore.append(honorZone.min() ?? 0)
        print("발표 점수 :: \(announceScore)")
    }
    return announceScore
}
//print(solution(3, [10, 100, 20, 150, 1, 100, 200]))
print(solution(4, [0, 300, 40, 300, 20, 70, 150, 50, 500, 1000]))

//다른 풀이로 일단 score로 들어오는 값을 honorZone에 넣고(위의 if honorZone.min()! < score[i] 부분이 없는 것) sort해서 가장 작은값을 POP하는 방법도 있다.
