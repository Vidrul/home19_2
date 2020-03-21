

import Foundation
class NetworkManager {
    static var shared = NetworkManager()

    var money: Array<MoneyInfo> = [MoneyInfo]()
    func loadCashRate(completed: @escaping () -> (Void)) {
        let urlString = "http://data.fixer.io/api/latest?access_key=3c8eb88e874d74e1553c306d2e07211a&base=EUR&symbols=USD,EUR,RUB,BYN"
        
        let url = URL(string: urlString)!
        let reguest = URLRequest(url: url)
        let task = URLSession.shared.dataTask(with: reguest) { (data, response, error) in
            guard let httpResponse = response as? HTTPURLResponse,
                httpResponse.statusCode == 200,
                error == nil,
                let data = data else {return}
            do {
                let moneyJSON = try JSONDecoder().decode(MoneyInfo.self, from: data)
                DispatchQueue.main.async {
                    self.money = [moneyJSON]
                    completed()
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
