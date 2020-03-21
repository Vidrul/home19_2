


import UIKit

class MoneyCourseTableViewCell: UITableViewCell {

 
    @IBOutlet weak var moneyCourseLable: UILabel!
    
    func set(title: String) {
        moneyCourseLable.text = title
    }
}
