import Foundation
import UIKit

//protocol AzanAPIDelegate {
//    func didRetrieveAzanInfo (Azan:Azan)
//}

extension MainViewController {
    
    func fetchData(Country: String, City:String) {
            
        let urlString = "\(urlBaseString)city=\(City)&country=\(Country)&method=5"
        print(urlString)

            // 1. Creat URL
        if let url = URL(string: urlString) {
            
            // 2. Creat URL session
            let session = URLSession(configuration: .default)
            
            // 3. Creat Task
            let task = URLSession.shared.dataTask(with: url, completionHandler: taskHandler(data:urlresponse:error:))
            
            // 4. Start \ Resume task
            task.resume()
            
        }else {
            print("error fetching data")
        }
        }

    func taskHandler (data: Data? , urlresponse:URLResponse? , error:Error?)->Void {
            
            do {
                
                let results:Azan = try JSONDecoder().decode(Azan.self, from: data!)
                print(results.status)
                didRetrieveAzanInfo(result: results)
                
            }catch{
                print(error)
            }
            
            //let datastring = String(data: data!, encoding: .utf8)
            //delegate?.didRetrieveCountryInfo(countryInfo: datastring!)
            
        }

}
