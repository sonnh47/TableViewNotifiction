

import UIKit

class MasterTableViewController: UITableViewController {
    
    @IBOutlet weak var footerView: UIView!
    @IBOutlet var noData: UIView!
    var arrNames = ["Nguyen Hoang Son", "Le Van Luyen", "Nguyen Van Hoang"]
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(setDone(notification:)), name: .done, object: nil)

    }
    // Xoa Lisener
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        noDataFunc()
        
    }
    func noDataFunc() {
        tableView.tableFooterView = arrNames.count == 0 ? (noData) : (footerView)
    }
    
    @objc func setDone(notification: NSNotification) {
        if let indexPath = tableView.indexPathForSelectedRow {
            arrNames[indexPath.row] = notification.object as! String
        }
        else {
            arrNames.insert(String(describing: notification.object!), at: 0)
        }
        tableView.reloadData()
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return arrNames.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = arrNames[indexPath.row]
        return cell
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let detailViewController = segue.destination as? DetailViewController {
            if let indexPath = tableView.indexPathForSelectedRow {
                detailViewController.bucket = arrNames[indexPath.row]
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrNames.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
            noDataFunc()
        }
    }

}
