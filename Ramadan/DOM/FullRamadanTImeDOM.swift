//
//  FullRamadanTImeDOM.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 20/3/22.
//

import Foundation
// MARK: - Welcome
struct FullRamadanDetails: Codable {
    let data: [Datum]
}

// MARK: - Datum
struct Datum: Codable {
    let distCode, distName: String
    let distRamadanDetails: [DistRamadanDetail]
}

// MARK: - DistRamadanDetail
struct DistRamadanDetail: Codable {
    let ramadanPeriod: String
    let ramadanDate, banglaDate, engDate, weekDay: String
    let sehri, iftar, date, sehriFormatted: String
    let iftarFormatted: String
}

struct CurrentRamadanDay{
    var ramadanDate, banglaDate, engDate, weekDay: String
    var sehri, iftar: String
}
