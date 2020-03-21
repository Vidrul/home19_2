
import UIKit

class MainViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    private let TableViewCellIdentifier = String(describing: MoneyCourseTableViewCell.self)
    
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
        let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellIdentifier) as!
        MoneyCourseTableViewCell
        let index = (NetworkManager.shared.money[indexPath.row].rates)
        let title = "EUR - USD: \(index.usd)\nEUR - RUB: \(index.rub)\nEUR - BYN: \(index.byn)"
        
        cell.set(title: title)
        return cell
    }
    
    
}
