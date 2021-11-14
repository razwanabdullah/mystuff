//


import UIKit

class MainVC: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, fetchImageDelegate {
    func getImageArray() {
        
        
        self.selecterView.reloadAllComponents()
        if MainVC.images.count == 1 {
            
            let data = try? Data(contentsOf: MainVC.images[0].imageUrl)
            self.myImageView.image = UIImage(data: data!)
            
            
        }
        else {
        let count = MainVC.images.count - 1
        
        print(count)
        
        self.selecterView.selectRow(count, inComponent: 0, animated: true)
            
            let data = try? Data(contentsOf: MainVC.images[count].imageUrl)
            self.myImageView.image = UIImage(data: data!)
           
        }
    }
    
 
    

   
    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var selecterView: UIPickerView!
  
    static var images = [myImages]()
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       
        selecterView.dataSource = self
        selecterView.delegate = self
        
        
        
    }
 
    
    
    @IBAction func MoveToAddImage(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AdImageVC") as! AdImageVC
        vc.getImage = self
        
        present(vc, animated: true, completion: nil)
        
        
    }
    


    
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return MainVC.images.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
        return MainVC.images[row].title
        
        
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
   
        
        let data = try? Data(contentsOf: MainVC.images[row].imageUrl)
        self.myImageView.image = UIImage(data: data!)
        
        
     }
    
}
