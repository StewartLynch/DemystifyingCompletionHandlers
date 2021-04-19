//
//  Service.swift
//  LilStockQuote
//
//  Created by Stewart Lynch on 2021-04-18.
//

import Foundation

enum Service {
    static func getStockInfo(symbol: String, completion: @escaping (Stock) -> Void) {
        let urlString = "https://api.lil.software/stocks?symbol=\(symbol.uppercased())"
        guard let url = URL(string: urlString) else {
            fatalError("URL could not be constructed")
        }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                fatalError("Error retieving quote: \(error.localizedDescription)")
            }
            let decoder = JSONDecoder()
            do {
                let stock = try decoder.decode(Stock.self, from: data!)
                completion(stock)
            } catch {
                fatalError("Error decoding data \(error.localizedDescription)")
            }
        }
        .resume()
    }
}
