import Foundation

class ConstMgr{
    //인벤토리
    static var inven:[Int] = []
    //오브젝트 상태
    static var objStates:[Int] = [0,0,0,0,0,0]
    //인벤토리에서 선택된 슬룻
    static var selectedSlot = -1
    //금고 잠금해제
    static var isSafeOpen = false
    //발견한 아이템
    static var findItem = 0
    //선택된 아이템
    static var selectedItem: Int {
        get{
            if selectedSlot != -1{
                return inven[selectedSlot]
            }else{
                return -1
            }
        }
    }
    //시간 측정
    static var time: Int = 0
    //플레이어 정보
    static var userData:[UserData] = [UserData("PJT",17384),UserData("HHJ",18364),UserData("KMS",16390)]
    
    //계수-------------------------------w
    static var NAME = ["작은 열쇠", "망치", "시계추", "드라이버","큰 열쇠"]
    static var MESSAGE = ["이 열쇠는 맞지 않는다.",
    "문은 굳게 잠겨있다. 맞는 열쇠가 필요할 것 같다.",
    "책장에 책이 꽂혀있다. 책에는 아무런 내용도 적혀있지 않다.",
    "잡동사니가 놓여있는 책상이다.",
    "빨간 책 = △, 파란 책 = ○, 초록 책 = □. 비밀번호는 ○△□",//5
    "금고가 열리는 소리가 났다.",
    "가운데 일자 홈이 있다. 손으로는 돌릴 수 없을 것 같다.",
    "작은 열쇠 구멍이 있다. 맞는 열쇠를 찾아야 한다.",
    "이 벽은 약해 보인다. 강한 충격을 주면 부술 수 있을 것 같다.",
    "반짝이는 뭔가가 보인다. 꺼내기 위해서는 긴 도구가 필요할 것 같다.",//10
    "괘종시계가 그려진 액자. 우측 하단에 화살표가 그려져 있다."
    ]
    static var MIS_MESSAGE = [
        "이 물건은 이곳에 쓰는 게 아닌 것 같다.",
        "다른 도구가 필요햐다.",
        "더 나은 방법이 있을 것이다.",
        "이 물건에는 다른 쓰임새가 있을 것이다."
    ]
}
