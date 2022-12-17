//
//  Extensions.swift
//  Netflix Clone
//
//  Created by MD Adil on 30/07/22.
//

import Foundation

extension String {
    func capitalizeFirstletter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
        
        
       }
        
    }
    

