import UIKit

class ViewController: UIViewController {
    
    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"]
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

extension ViewController: UITableViewDataSource {
    // Здесь будут наши методы dataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return words.count
        let vegOrFruitArray = words[section] // получили массив по номеру секции
        return vegOrFruitArray.count // вернули количество элементов в нём
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: UITableViewCell
        
        if let reusedCell = tableView.dequeueReusableCell(withIdentifier: "cell") {
            cell = reusedCell
        } else {
            cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        }
        
        //cell.textLabel?.text = words[indexPath.row]
        var content = cell.defaultContentConfiguration()
        content.text = words[indexPath.section] [indexPath.row]
        cell.contentConfiguration = content
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return words.count
    }
}
