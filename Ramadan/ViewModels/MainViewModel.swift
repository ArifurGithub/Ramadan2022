//
//  MainViewModel.swift
//  Ramadan
//
//  Created by MTB MacbookPro on 17/3/22.
//

import Foundation

class MainViewModel: ObservableObject{
    
    enum State {
            case idle
            case loading
            case failed(Error)
            case loaded(DetailsDOM)
        }
    enum State2 {
            case idle
            case loading
            case failed(Error)
            case loaded(FullRamadanDetails)
        }
    @Published private(set) var stateFullRamadan = State2.idle
    @Published private(set) var state = State.idle

//    func load() {
//        state = .loading
//
//        NetworkCallRepository.getMovieList(completion: <#T##(String, String) -> Void##(String, String) -> Void##(_ response: String, _ errorMessage: String) -> Void#>, onError: <#T##(NSError?) -> Void##(NSError?) -> Void##(_ error: NSError?) -> Void#>)(withID: articleID) { [weak self] result in
//            switch result {
//            case .success(let article):
//                self?.state = .loaded(article)
//            case .failure(let error):
//                self?.state = .failed(error)
//            }
//        }
//    }
    
    func loadDetails() {
        state = .loading
        
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let currentDateString = formatter.string(from: currentDate)
        
        let url = URL(string: "https://api.aladhan.com/v1/timingsByAddress/\(currentDateString)?address=\(ConstantValues.selectedDistNameEn),ASIA")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 var detialsResponse: DetailsDOM!
                 do {
                     detialsResponse = try JSONDecoder().decode(DetailsDOM.self, from: data)

                     self.state = .loaded(detialsResponse)
                 }
                 catch
                 {
                     self.state = .failed(error)
                 }
                 
                 print("Data from server\(detialsResponse)")
             }
            
        }
        task.resume()
    }
    
    // Get Full Ramadan Time list
    func loadFullRamadanDetails() {
        stateFullRamadan = .loading
        
        let url = URL(string: "http://sbitsbd.com/ramadanApp/json_resp.php?dist=\(ConstantValues.selectedDistCode)")!
        var request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 60)
        request.setValue("application/png", forHTTPHeaderField: "Content-Type")
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
                 self.stateFullRamadan = .failed(error)
             } else if let data = data {
                //let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]
                 
                 var fullRamadanDetails: FullRamadanDetails!
                 do {
                     fullRamadanDetails = try JSONDecoder().decode(FullRamadanDetails.self, from: data)

                     self.stateFullRamadan = .loaded(fullRamadanDetails)
                 }
                 catch
                 {
                     self.stateFullRamadan = .failed(error)
                 }
                 
                 print("Full Ramadan Data from server\(fullRamadanDetails)")
             }
            
        }
        task.resume()
    }
}
