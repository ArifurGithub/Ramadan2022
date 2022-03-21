//
//  Enums.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import Foundation

enum LoadingState<Value> {
    case idle
    case loading
    case failed(Error)
    case loaded(Value)
}
