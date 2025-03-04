//
//  Item.swift
//  MovieDiscovery
//
//  Created by Sathish kumar on 3/4/25.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
