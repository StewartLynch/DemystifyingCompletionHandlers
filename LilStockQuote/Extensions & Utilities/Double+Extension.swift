//
//  Double+Extension.swift
//  StockQuote
//
//  Created by Stewart Lynch on 2021-04-17.
//

import Foundation

extension Double {
    func asCurrency() -> String {
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .currency
        return numberFormatter.string(for:self) ?? ""
    }
}
