//
//  Stock.swift
//  StockQuote
//
//  Created by Stewart Lynch on 2021-04-17.
//

import Foundation

struct Stock: Codable {
  let open: Double
  let high: Double
  let low: Double
  let current: Double
  let previous_close: Double
  let name: String?
}
