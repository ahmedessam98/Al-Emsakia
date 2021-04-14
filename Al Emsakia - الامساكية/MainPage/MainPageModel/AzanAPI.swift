import Foundation
import UIKit

//protocol AzanAPIDelegate {
//    func didRetrieveAzanInfo (Azan:Azan)
//}

extension MainViewController {
    
    func fetchData(Country: String, City:String) {
            
        let urlString = "\(urlBaseString)city=\(City)&country=\(Country)&method=5"
        
            // 1. Creat URL
        if let url = URL(string: urlString) {
            
            // 2. Creat URL session
            _ = URLSession(configuration: .default)
            
            // 3. Creat Task
            let task = URLSession.shared.dataTask(with: url, completionHandler: taskHandler(data:urlresponse:error:))
            
            // 4. Start \ Resume task
            task.resume()
            
        }else {
            print("error fetching data")
        }
        }

    func taskHandler (data: Data? , urlresponse:URLResponse? , error:Error?)->Void {
            
         
        if let data = data {
            
           do {
                
              let results:Azan = try JSONDecoder().decode(Azan.self, from: data)
                print("Fetching data completed")
                didRetrieveAzanInfo(result: results)
                
              }catch{
                print(error)
            }
        }else {
            //1. Creat alert
                let alert = UIAlertController(title: "No Internet Connection", message: "", preferredStyle: .alert)
                
            //2. Creat action
                let cancell = UIAlertAction(title: "Cancell", style: .default, handler: nil)
                
            //3. add action to alert
                alert.addAction(cancell)
                
            //4. present the alert
                present(alert, animated: true, completion: nil)
                

        }
    }
}
