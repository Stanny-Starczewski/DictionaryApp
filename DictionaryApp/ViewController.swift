import UIKit

class ViewController: UIViewController {
    
    let words = [
        ["Apple", "Pear", "Watermelon"],
        ["Carrot", "Pickle", "Potato", "Tomato"]
    ]
    
    let headers = ["Fruits", "Vegetables"]
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        tableView.sectionHeaderHeight = 32
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
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return headers[section]
    }
}

extension ViewController: UITableViewDelegate {
    // тут располагаются методы делегата
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let alert = UIAlertController(title: nil,
                                  message: "Вы нажали на: \(words[indexPath.section] [indexPath.row])",
                                  preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            alert.dismiss(animated: true)
        }
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}


