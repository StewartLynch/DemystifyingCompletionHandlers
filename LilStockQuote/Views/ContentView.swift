//
//  ContentView.swift
//  StockQuote
//
//  Created by Stewart Lynch on 2021-04-17.
//

import SwiftUI

struct ContentView: View {
    @State var stock:Stock?
    @State private var symbol: String = ""
    @State private var isFetching = false
    var body: some View {
        NavigationView {
            VStack {
                if isFetching {
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle())
                }
                TextField("Enter Stock Symbol", text: $symbol)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                Button("Get Update") {
                    isFetching = true
                    stock = nil
//                    Service.getStockInfo(symbol: symbol, completion: displayStockInfo)
                    Service.getStockInfo(symbol: symbol) { (stock) in
                        Log.location(fileName: #file)
                        Log.queue(action: "In Closure")
                        DispatchQueue.main.async {
                            Log.queue(action: "In DispatchQueue.main")
                            self.stock = stock
                            symbol = ""
                            isFetching = false
                        }
                    }
                }
                if let stock = stock {
                    VStack {
                        Text(stock.name ?? "Unknown Stock")
                            .font(.title)
                        PropertyView(name: "Open", value: stock.open)
                        PropertyView(name: "High", value: stock.high)
                        PropertyView(name: "Low", value: stock.low)
                        PropertyView(name: "Current", value: stock.current)
                        PropertyView(name: "Prev", value: stock.previous_close)
                    }
                }
                Spacer()
            }
            .disabled(isFetching)
            .padding()
            .navigationTitle("Lil Stock Quote")
        }
    }
    
    func displayStockInfo(stock: Stock) {
        self.stock = stock
    }

    struct PropertyView: View {
        let name: String
        let value: Double
        var body: some View {
            HStack {
                Text(name)
                    .fontWeight(.bold)
                Text(value.asCurrency())
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}



