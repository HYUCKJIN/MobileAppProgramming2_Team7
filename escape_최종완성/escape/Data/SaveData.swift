import Foundation


class SaveData: NSObject, NSCoding{
    
    override init(){
    }
    //불러오기
    required init?(coder aDecoder: NSCoder) {
        ConstMgr.inven = aDecoder.decodeObject(forKey: "inven") as! [Int]
        ConstMgr.objStates = aDecoder.decodeObject(forKey: "objStates") as! [Int]
        ConstMgr.time = aDecoder.decodeInteger(forKey: "time")
        let tempData = aDecoder.decodeObject(forKey: "userData") as! [Data]
        ConstMgr.userData = tempData.flatMap {return UserData(data: $0)}
    }
    //저장하기
    func encode(with aCoder: NSCoder) {
        aCoder.encode(ConstMgr.inven, forKey: "inven")
        aCoder.encode(ConstMgr.objStates, forKey: "objStates")
        aCoder.encode(ConstMgr.time, forKey: "time")
        let userData = ConstMgr.userData.map { $0.encode() }
        aCoder.encode(userData, forKey: "userData")
    }
}
struct UserData{
    var name:String
    var time:Int
    init(_ name: String, _ time: Int){
        self.name = name
        self.time = time
    }
}
extension UserData {
    func encode() -> Data {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(name, forKey: "name")
        archiver.encode(time, forKey: "clearTime")
        archiver.finishEncoding()
        return data as Data
    }
    
    init?(data: Data) {
        let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
        defer {
            unarchiver.finishDecoding()
        }
        self.name = unarchiver.decodeObject(forKey: "name") as! String
        self.time = unarchiver.decodeInteger(forKey: "clearTime")
    }
}
