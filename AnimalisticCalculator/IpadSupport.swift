//
//  IpadSupport.swift
//  AnimalisticCalculator
//
//  Created by Guy Steinberg on 2024-04-16.
//

import Foundation
import UIKit

extension UIDevice {
    static var isIpad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
