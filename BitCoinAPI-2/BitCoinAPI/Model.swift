//
//  Model.swift
//  BitCoinAPI
//
//  Created by Rania Arbash on 2021-11-19.
//


import Foundation

struct Currency: Decodable {
    
    let success: Bool
      let timestamp: Int
      let base, date: String
      let rates: [String: Double]
}

