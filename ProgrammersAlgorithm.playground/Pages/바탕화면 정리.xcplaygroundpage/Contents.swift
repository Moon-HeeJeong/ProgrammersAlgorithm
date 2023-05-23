//:> 연습문제 바탕화면 정리
/*:>
Lv.1
 */

import Foundation

//: 🌱solutionA (100%)
//다른 방법으로 왼쪽 오른쪽 x,y 값을 나눠서 min, max를 계속 비교하는 방식도 있다
func solutionA(_ wallpaper:[String]) -> [Int] {
    
    
    var startPosX: Int?
    var startPosY: Int?
    var endPosX: Int = 0
    var endPosY: Int = 0
    
    for i in 0..<wallpaper.count{
        
        for str in wallpaper[i].enumerated(){
         
            print(str)
            
            if str.element == "#"{
                print("find # \(str.offset)")
                
                if startPosY == nil{ //start x 값은 변할 수 있지만 start y 값은 처음으로 나오는 #의 y값 고정임
                    startPosY = i
                }
                
                if let x = startPosX{
                    startPosX = min(str.offset, x)
                }else{
                    startPosX = str.offset
                }
                
                endPosX = max(str.offset, endPosX)
                endPosY = i
            }
            
            
            
        }
    }
    print("start \(startPosX),\(startPosY) end \(endPosX+1),\(endPosY+1)")
    
    return [startPosY ?? 0,startPosX ?? 0,endPosY+1,endPosX+1]
}
//print(solution([".#...", "..#..", "...#."]))
print(solutionA(["..........", ".....#....", "......##..", "...##.....", "....#....."]))
