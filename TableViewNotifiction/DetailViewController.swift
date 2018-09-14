
import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var txtData: UITextField!
    var bucket: String!
    //    var space = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if txtData.text != nil {
            txtData.text = bucket
        }
    }
    
    //    func checkSpace() -> Bool {
    //        var s = ""
    //        for _ in 1 ... bucket.count {
    //            s += " "
    //        }
    //        space.append(s)
    //        return true
    //    }
    //
    @IBAction func btnDone(_ sender: Any) {
        
        bucket = txtData.text!
        let trimmed = (txtData.text)!.trimmingCharacters(in: .whitespaces)
        if (bucket.isEmpty) {
            let alert = UIAlertController(title: "Thong Bao", message: "Xin moi ban nhap ten ", preferredStyle: .alert)
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
            self.present(alert, animated: true, completion: nil)
        }
        else{
            var space = ""
            var s = ""
            for _ in 1 ... bucket.count {
                s += " "
            }
            space.append(s)
            if bucket == space{
                print("eroor")
                let alert = UIAlertController(title: "Thong Bao", message: "Xin moi ban nhap ten ", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default))
                self.present(alert, animated: true, completion: nil)
            }
            else {
                
                NotificationCenter.default.post(name: .done, object: trimmed)
                navigationController?.popViewController(animated: true)
            }
            
        }
        
    }
    
}
