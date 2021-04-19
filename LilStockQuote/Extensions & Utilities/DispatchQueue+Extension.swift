//
//  DispatchQueue+Extension.swift
//  ThreadingAndGCD
//
//  Created by Stewart Lynch on 2020-06-11.
//  Copyright © 2020 CreaTECH Solutions. All rights reserved.
//

import Foundation

extension DispatchQueue {
    static func log(action: String) {
        print("""
                 \(action):
                 👫 \(String(validatingUTF8: __dispatch_queue_get_label(nil))!)
                 🧵 \(Thread.current)
            
            """)
    }
}


