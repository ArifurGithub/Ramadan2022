//
//  Network.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 20/3/22.
//

import Foundation

import SwiftUI

class Network: ObservableObject{
    @Published var fullRamadanTime: [DistRamadanDetail] = []
    @Published var currentDayRamadanDetails: CurrentRamadanDay = CurrentRamadanDay(ramadanDate: "", banglaDate: "", engDate: "", weekDay: "", sehri: "", iftar: "")
    
    //Mark: Get Full Ramadan data List
    func getFullRamadanList(districtCode: String) {
        guard let url = URL(string: "http://sbitsbd.com/ramadanApp/json_resp.php?dist=\(districtCode)") else { fatalError("Unknown URL") }

        let urlRequest = URLRequest(url: url)

        let dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, response, error) in
            if let error = error {
                print("Request error: ", error)
                return
            }

            guard let response = response as? HTTPURLResponse else { return }

            if response.statusCode == 200 {
                guard let data = data else { return }
                DispatchQueue.main.async {
                    do {
                        let decodedUsers = try JSONDecoder().decode(FullRamadanDetails.self, from: data)
                        self.fullRamadanTime = decodedUsers.data[0].distRamadanDetails
                        self.filterDetails()
                    } catch let error {
                        print("Error decoding: ", error)
                    }
                }
            }
        }

        dataTask.resume()
    }
    
    //Mark: Filter FullDetilas for current Date
    func filterDetails() {
        let currentDate = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "dd-MM-yyyy"
        let currentDateString = formatter.string(from: currentDate)
        
        for item in fullRamadanTime {
            if item.date == "03-04-2022" {
                currentDayRamadanDetails = CurrentRamadanDay(ramadanDate: item.ramadanDate, banglaDate: item.banglaDate, engDate: item.engDate, weekDay: item.weekDay, sehri: item.sehri, iftar: item.iftar)
                print(currentDayRamadanDetails)
                break
            }
        }
    }
}
