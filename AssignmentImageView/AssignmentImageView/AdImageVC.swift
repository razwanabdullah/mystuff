//
//
//

import UIKit


protocol fetchImageDelegate {
    
    func getImageArray()
}


class AdImageVC: UIViewController {

    var getImage: fetchImageDelegate?
    @IBOutlet weak var imageTitleTF: UITextField!
    @IBOutlet weak var imageUrlTF: UITextField!
    
    
    var imageArray = [myImages]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        keypadHide(myView: view)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    
    
    func keypadHide(myView thisView: UIView) {
        
        let tap = UITapGestureRecognizer(target: thisView, action: #selector(UIView.endEditing))
        thisView.addGestureRecognizer(tap)
    }
    @objc func keyboardWillShow(notification: NSNotification) {
        
        if let keyboardFrame: NSValue = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue {
            let keyboardRectangle = keyboardFrame.cgRectValue
            let keyboardHeight = keyboardRectangle.height
            self.view.frame.origin.y = -50
        }
        
        
    }
    
    @objc func keyboardWillHide(notification: NSNotification) {
        if self.view.frame.origin.y != 0 {
            self.view.frame.origin.y = 0
            
        }
    }

  
    @IBAction func cancelButtonAction(_ sender: Any) {
     
        dismiss(animated: true)
    }
    
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        
        let title = self.imageTitleTF.text!
        let url = self.imageUrlTF.text!
        
        let newImage = myImages(title: title, imageUrl: URL(string: url)!)
       
        MainVC.images.append(newImage)
        print(MainVC.images.count)
        DispatchQueue.main.async {
            self.getImage?.getImageArray()
        }
        
        dismiss(animated: true)
        
        
        
    }
    
    
    
    
    
}
