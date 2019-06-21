import UIKit

class RankViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        ConstMgr.userData.sort(by: {$0.time < $1.time})
    }
    @IBAction func Back(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
extension RankViewController{
    //행의 개수
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ConstMgr.userData.count
    }
    //각 행에 데이터 세팅
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RankTableViewCell", for: indexPath) as! RankTableViewCell
        cell.nameLB.text = "\(indexPath.row+1). \(ConstMgr.userData[indexPath.row].name)"
        cell.TimeLB.text = String(ConstMgr.userData[indexPath.row].time.timeCalculating())
        return cell
    }
}
