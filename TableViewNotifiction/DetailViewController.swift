
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var txtData: UITextField!
    var bucket: String?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if txtData.text != nil {
            txtData.text = bucket
        }
    }
    
    @IBAction func btnDone(_ sender: Any) {
        bucket = txtData.text
        NotificationCenter.default.post(name: .done, object: bucket)
        navigationController?.popViewController(animated: true)
    }
    
}
