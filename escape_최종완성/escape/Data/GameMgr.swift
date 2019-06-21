import Foundation

class GameMgr{
    static var instance: GameMgr?
    var currentInven:InventoryView?
    var timer = Timer()
    
    init(){
        GameMgr.instance = self
        DataLoad()
    }
    func GameStart(){
        timerActive()
    }
    func GameEnd(){
        stopTimer()
    }
    func GetState() -> Int{
        return 1
    }
    //파일 불러오기
    func DataLoad(){
        let fileMgr = FileManager.default
        if fileMgr.fileExists(atPath: GetPath()){
            NSKeyedUnarchiver.unarchiveObject(withFile: GetPath()) as! SaveData
        }
    }
    func DataSave() {
        let data = SaveData()
        NSKeyedArchiver.archiveRootObject(data, toFile: GetPath())
    }
    
    func GetPath() -> String{
        let dirPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)
        let docsDir = dirPath[0] as NSString
        return docsDir.appendingPathComponent("data2.archive")
    }
    func resetData(){
        ConstMgr.inven = []
        //오브젝트 상태
        ConstMgr.objStates = [0,0,0,0,0,0]
        //인벤토리에서 선택된 슬룻
        ConstMgr.selectedSlot = -1
        //금고 잠금해제
        ConstMgr.isSafeOpen = false
        //발견한 아이템
        ConstMgr.findItem = 0
        //시간 초기화
        ConstMgr.time = 0
    }
    //아이템 획득메소드
    func GetItem(){
        ConstMgr.inven.append(ConstMgr.findItem)
    }
    //아이템 사용메소드
    func RemoveItem(){
        ConstMgr.inven.remove(at: ConstMgr.selectedSlot)
        ConstMgr.selectedSlot = -1
    }
    //오사용 메시지
    func Mis_MSG() -> String{
        return ConstMgr.MIS_MESSAGE[Int.random(in: 0..<ConstMgr.MIS_MESSAGE.count)]
    }
    func timerActive(){
        timer = Timer.scheduledTimer(timeInterval: 0.01,
                                     target: self,
                                     selector: #selector(timeCnt),
                                     userInfo: nil,
                                     repeats: true)
    }
    @objc func timeCnt(timer: Timer){
        ConstMgr.time += 1
        currentInven?.refresh()
    }
    func stopTimer(){
        timer.invalidate()
    }
    func OnPause(){
        timer.invalidate()
        RoomViewController.currentRoom?.CallPauseView()
    }
    func OnPuaseEnd(){
        timerActive()
    }
}
extension Int{
    func timeCalculating() -> String {
        if self >= 599999 {
            return "99:59:99"
        }
        else {
            let msec = self % 100
            let sec = ( (self - msec) / 100 ) % 60
            let min = ( (self - sec - msec) / 100 ) / 60
            
            return setNum(min) + ":" + setNum(sec) + ":" + setNum(msec)
        }
    }
    func setNum(_ input: Int)-> String {
        if input/10 == 0 && input % 10 > 0 {
            return "0" + String(input)
        }
        else if input == 0{
            return "00"
        }
        else {
            return String(input)
        }
    }
}
