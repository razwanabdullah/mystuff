//
//  PopularCurrenciesVC.swift
//  BitCoinAPI
//
//  Created by Razwan on 13/12/2021.
//

import UIKit
import CoreData

class PopularCurrenciesVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    var item: [SavedCurrency]?
    
    @IBOutlet weak var allPopularCurrenciesTable: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        self.title = "Popular Currencies"
        fetchData()
        
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

                
                
                
                
                self.allPopularCurrenciesTable.reloadData()
                
            }
        }
        
        catch {
            print("error")
            
        }
        
        
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = allPopularCurrenciesTable.dequeueReusableCell(withIdentifier: "AllPopularCurrenciesCell") as! AllPopularCurrenciesCell
    
        
        cell.cNAme.text = self.item![indexPath.row].cSymbol
        cell.rate.text = String(self.item![indexPath.row].rate)
     
    return cell
    }

}
