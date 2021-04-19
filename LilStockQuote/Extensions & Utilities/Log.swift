//
//  Log.swift
//  ThreadingAndGCD
//
//  Created by Stewart Lynch on 2020-06-11.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

enum Log {
    static func queue(action: String) {
        DispatchQueue.log(action: action)
    }
    
    static func location( fileName: String,
                          functionName: String = #function,
                          lineNumber: Int = #line) {
        
        print("Called by \(fileName.components(separatedBy: "/").last ?? fileName) - \(functionName) at line \(lineNumber)")
    }
}
