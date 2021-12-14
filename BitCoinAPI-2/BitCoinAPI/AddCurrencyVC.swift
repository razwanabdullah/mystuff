//
//  AddCurrencyVC.swift
//  BitCoinAPI
//
//  Created by Razwan on 13/12/2021.
//

import UIKit
import CoreData

class AddCurrencyVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
 
    
var isAlreadyExisting = false
    
    @IBOutlet weak var curencyTF: UITextField!
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    var selectedCurrency = ""
    var rate = ""
    var item: [SavedCurrency]?
    @IBOutlet weak var currencyTable: UITableView!
    
    @IBOutlet weak var addButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.title = "Add Currencies"
        fetchData()
        self.curencyTF.isUserInteractionEnabled = false
        self.curencyTF.text = self.selectedCurrency
        
        
    }
    
    func addData(){
        
        let newCurrency = SavedCurrency(context: self.context)
   
        newCurrency.cSymbol = self.selectedCurrency
        newCurrency.rate = Double(self.rate)!
        
        do {
            
            try self.context.save()
            
           
            
        }
        catch {
            
            print("error")
            
        }
        self.fetchData()
        
    }

    
    func fetchData(){
        
        do {
            
            self.item = try context.fetch(SavedCurrency.fetchRequest())
            
            DispatchQueue.main.async {
                
                for it in self.item! {
                    let selectedC = it.cSymbol ?? ""
                 Services.Shared.CompareWithBitcoin(currency: selectedC) { dict in


                     let priceOfBitcoin = dict["amount"] as? String ?? ""
                     let itemToBeUpdated = it
                     
                   
                     
                     itemToBeUpdated.rate = Double(priceOfBitcoin)!
                     
                     
                     do {
                         
                         try self.context.save()
                         
                     }
                     catch {
                         print("error")
                         
                         
                     }
                     
                     
                     print(priceOfBitcoin)
                 }
                    

                 }

                
                
                
                
                self.currencyTable.reloadData()
                
            }
        }
        
        catch {
            print("error")
            
        }
        
        
    }
    
    
    
    
    
    @IBAction func addCurrency(_ sender: Any) {
        
        self.addButton.isUserInteractionEnabled = false
        self.addButton.isEnabled = false
        if isAlreadyExisting {
            let alert = UIAlertController(title: "Sorry", message: "Currency is already added", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        else{
        addData()
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = currencyTable.dequeueReusableCell(withIdentifier: "PopularCurencyCell") as! PopularCurencyCell
    
        
        cell.currencyName.text = self.item![indexPath.row].cSymbol
        cell.rate.text = String(self.item![indexPath.row].rate)
        if self.curencyTF.text == cell.currencyName.text {
            
            self.isAlreadyExisting = true
            
        }
    return cell
    }
    
}
