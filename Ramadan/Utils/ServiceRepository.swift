//
//  ServiceRepository.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import Foundation

class ServiceRepository{
    
    //Get Movie List
    class func getMovieList(completion: @escaping ( _ response: String,  _ errorMessage: String ) -> Void, onError: @escaping (_ error: NSError?) -> Void)
    {
        
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=a07e22bc18f5cb106bfe4cc1f83ad8ed")!
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task = session.dataTask(with: request) { (data, response, error) in
             // This will run when the network request returns
             if let error = error {
                    print(error.localizedDescription)
             } else if let data = data {
                    let dataDictionary = try! JSONSerialization.jsonObject(with: data, options: []) as! [String: Any]

                    // TODO: Get the array of movies
                    // TODO: Store the movies in a property to use elsewhere
                    // TODO: Reload your table view data
                 let movies : [[String:Any]] = dataDictionary["results"] as! [[String:Any]]
                 print("\(dataDictionary)  Movie List \(movies.count)")
             }
            
        }
        task.resume()
        
//        if let url = URL(string: urlStr)
//        {
//            MTBBackendServiceProvider().createPostRequestForStopCheque(requestURL: url, parameters: parameters_, completion:
//                {
//                    json in
//                    print("Saving positive Reponse : \(json)")
//                    let positiveResponse = (ComponentFactory.getCommonGlobalResponseFromJSON(json: json))
//                    completion(positiveResponse.0, positiveResponse.1)
//
//            }, onError:
//                {
//                    error in
//                    onError(error)
//            })
//        }
    }
}
