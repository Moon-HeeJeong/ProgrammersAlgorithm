//:> Summer/Winter Coding(~2018) 스킬트리
/*:>
 Lv.2
 */


import Foundation

//: 🌱solution (21.4%) -> (100%)
//선행스킬을 아예 거치지 않는 스킬트리의 경우도 추가하니 100퍼 됨

func solution(_ skill:String, _ skill_trees:[String]) -> Int {
    
    var isPossibleCnt = 0
    
    for tree in skill_trees{
        print("tree ::::: \(tree)")
        var sequence = 0
        
        for str in tree.enumerated(){
            print("str \(str)")
            let strValue = str.element.description
            
            if skill.contains(strValue){
                
                let seq = String.Index(encodedOffset: sequence)
                
                if skill[seq].description == strValue{
                    print("skill \(skill[seq].description) strValue \(strValue) 가 일치")
                    sequence += 1
                    
                    if (sequence == skill.count - 1){
                        print("1) 가능한 스킬트리 입니다. ")
                        isPossibleCnt += 1
                        break
                    }
                }else{
                    print("skill \(skill[seq].description) strValue \(strValue) 가 불일치")
                    break
                }
            }
            
            if (str.offset == tree.count - 1){
                print("2) 가능한 스킬트리 입니다. ")
                isPossibleCnt += 1
                break
            }
        }
    }
    return isPossibleCnt
}


//print(solution("CBD", ["BACDE", "CBADF", "AECB", "BDA"]))
print(solution("CBD", ["AEFG", "EFG", "GHI", "RRR"]))
