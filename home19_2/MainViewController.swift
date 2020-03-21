
import UIKit

class MainViewController: UIViewController{

    @IBOutlet weak var tableView: UITableView!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        
        NetworkManager.shared.loadCashRate {
            self.tableView.reloadData()
        }
        
       
    }


}

extension MainViewController: UITableViewDataSource, UITableViewDelegate{
    
  
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return NetworkManager.shared.money.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MoneyCourseTableViewCell") as!
        MoneyCourseTableViewCell
        cell.moneyCourseLable.text = "\(NetworkManager.shared.money[indexPath.row].date)"
        
        return UITableViewCell()
    }
    
    
}
