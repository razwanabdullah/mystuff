//
//  ViewController.swift
//  BitCoinAPI
//
//  Created by Rania Arbash on 2021-11-19.
//

import UIKit
import CloudKit

class ViewController: UIViewController , UIPickerViewDelegate,UIPickerViewDataSource{
    
    var currencies : Currency?
   
    @IBOutlet weak var bitCoinPriceLabel: UILabel!
    @IBOutlet weak var picker: UIPickerView!
    
    var currency: NSDictionary?
   
    var selectedItem = ""
    var selectedRate = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Services.Shared.fetchCurrencies { currenc in
            DispatchQueue.main.async {
               
                self.currencies = currenc
                
                let rate = self.currencies?.rates
                self.currency = rate! as NSDictionary
                
//                print(self.currency)
                
                self.picker.reloadAllComponents()
  
            }
            
        }
        
       
        
    }

    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let array = self.currency?.allKeys {
            print(array.count)
            return array.count
        }
        return 0
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
     
        if let array = self.currency?.allKeys {
           
            return array[row] as? String
        }
        
        
        
        return ""
    }
    
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let array = currency?.allValues {

//        print(array[row] as? Double ?? 0)

           selectedItem = currency?.allKeys[row] as? String ?? ""
            
            Services.Shared.CompareWithBitcoin(currency: "\(currency?.allKeys[row] as? String ?? "")") { dict in


                let priceOfBitcoin = dict["amount"] as? String ?? ""
                self.selectedRate = priceOfBitcoin
                print(priceOfBitcoin)

                DispatchQueue.main.async {
                    self.bitCoinPriceLabel.text = "\(priceOfBitcoin) \(self.currency?.allKeys[row] as? String ?? "")"
                }




            }

    }
        
        
    }
    
    
    @IBAction func popularAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "PopularCurrenciesVC") as! PopularCurrenciesVC
      
        navigationController?.pushViewController(vc, animated: true)
        
    }
    
    
    
    @IBAction func addButtonAction(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(withIdentifier: "AddCurrencyVC") as! AddCurrencyVC
        
        vc.selectedCurrency = self.selectedItem
        vc.rate = selectedRate
        print(selectedRate)
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
    
    
    
}

