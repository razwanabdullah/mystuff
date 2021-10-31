import UIKit
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var qtyLabel: UILabel!
    @IBOutlet weak var productLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: UIAlertController.Style.alert)

    
    @IBOutlet weak var historyView: UITableView!
    var finalIndex:Int = 99
    
    
    struct ItemName{
        var name :String
        var price:Int
        var qty:Int
        
        init(name : String, price :Int, qty: Int){
            self.name = name
            self.price = price
            self.qty = qty
        }
    }
    // Data model: These strings will be the data for the table view cells
    var itemList: [ItemName] = [ItemName(name: "Pants", price: 100, qty: 20),
                                ItemName(name: "Shoes", price: 100, qty: 30),
                                ItemName(name: "Hats", price: 100, qty: 0),
                                ItemName(name: "Tshirts", price: 100, qty: 10),
                                ItemName(name: "Dresses", price: 100, qty: 24),
                                ]
    
    // cell reuse id (cells that scroll out of view can be reused)
    let cellReuseIdentifier = "cell"

    
    func test(_ match : inout DataFile){
        print(match.name)
    }
   
    // don't forget to hook this up from
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Register the table view cell class and its reuse id
        self.tableView.register(UITableViewCell.self , forCellReuseIdentifier: cellReuseIdentifier)
               
               // (optional) include this line if you want to remove the extra empty cell divider lines
               // self.tableView.tableFooterView = UIView()

               // This view controller itself will provide the delegate methods and row data for the table view.
               tableView.delegate = self
               tableView.dataSource = self
        
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))


        
        
        
      
        
       
    }
    
    // number of rows in table view
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemList.count
    }
    
    // create a cell for each table view row
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // create a new cell if needed or reuse an old one
        let cell:UITableViewCell = (self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier) as UITableViewCell?)!
        
        // set the text from the data model
        
        cell.textLabel?.text = self.itemList[indexPath.row].name +
            " | Qty:    "  + (String)(self.itemList[indexPath.row].qty) +
        "  | Price:    "  + (String)(self.itemList[indexPath.row].price)

        return cell
    }
    
    // method to run when table view cell is tapped
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        self.productLabel.text = self.itemList[indexPath.row].name
        
       
        
        finalIndex = indexPath.row
        print(finalIndex)
    }
    
    
    
    
    
    @IBAction func pressOne(_ sender: Any) {
        
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "1"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }
        


    }
    
    
    @IBAction func pressTwo(_ sender: Any) {
        
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "2"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    
    @IBAction func pressThree(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "3"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    
    @IBAction func pressFour(_ sender: Any) {
        
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "4"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    @IBAction func pressFive(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "5"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    
    @IBAction func pressSix(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "6"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    
    @IBAction func pressSeven(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "7"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    @IBAction func pressEight(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "8"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    @IBAction func pressnine(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "9"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    
    @IBAction func pressZero(_ sender: Any) {
        if(finalIndex == 99){
            self.present(alert, animated: true, completion: nil)

        }
        else{
            self.qtyLabel.text = self.qtyLabel.text! + "0"
            
            self.priceLabel.text = String(itemList[finalIndex].price * Int(qtyLabel.text!)!)
        }    }
    
    
    
    @IBAction func pressBuy(_ sender: Any) {
        
        if(Int(qtyLabel.text!)! < itemList[finalIndex].qty){
            
            
            let qtyy = self.itemList[finalIndex].qty -  Int(qtyLabel.text!)!
            
            let pricee = Int(priceLabel.text!)
            
            self.itemList[finalIndex] = ItemName(name: productLabel.text!, price:pricee ?? 0 ,qty:qtyy)
            
            
            self.tableView.reloadData()
            
            finalIndex =  99
            self.qtyLabel.text = ""
            self.priceLabel.text = ""
            self.productLabel.text = ""
            
        }
        else{
            self.present(alert, animated: true, completion: nil)
        }
       
    }
}
