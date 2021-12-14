
import Foundation

class Services {
    
    static var Shared = Services()
    
    public  func fetchCurrencies(completion:@escaping(Currency) -> ()) {
//
//    https://apiv2.bitcoinaverage.com/indices/global/ticker/BTC
//
//    https://apiv2.bitcoinaverage.com/constants/exchangerates/global
        
         let currenciesURL = URL(string: "http://api.exchangeratesapi.io/v1/latest?access_key=941f94c5bf26e6d8bc6e92a4ec8b507d")
      
        let request = NSMutableURLRequest(url: currenciesURL!)
        request.httpMethod = "GET"
    
//        request.setValue("text/html", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with:  request as URLRequest) { (data, request, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return } //no data
            
            do {
         
                let currency: Currency = try JSONDecoder().decode(Currency.self, from: data)
//                print(currency)
                    completion(currency)
             
            }catch{
                print(error)
            }
            
         
        }.resume()
    }
    
    public  func CompareWithBitcoin(currency: String, completion:@escaping(NSDictionary) -> ()) {

        
         let currenciesURL = URL(string: "https://api.coinbase.com/v2/prices/spot?currency=\(currency)")
      
        let request = NSMutableURLRequest(url: currenciesURL!)
        request.httpMethod = "GET"
    
//        request.setValue("text/html", forHTTPHeaderField: "Content-Type")
        
        URLSession.shared.dataTask(with:  request as URLRequest) { (data, request, error) in
            if let error = error {
                print(error.localizedDescription)
                return
            }
            guard let data = data else { return } //no data
            
            do {
         
                
                let rootDic = try JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.fragmentsAllowed) as? NSDictionary
                let dic2 =  rootDic?.value(forKey: "data") as? NSDictionary
                completion(dic2 ?? [:])
//                    print(rootDic)
                
            }catch{
                print(error)
            }
            
         
        }.resume()
    }

    
}

