//
//  FeedbackType.swift
//  ImpactGenerator
//
//  Created by Seunghun on 7/20/24.
//

import Foundation

enum FeedbackType: String, CaseIterable, Identifiable {
    var id: String { self.rawValue }
    
    case heavy = "Heavy"
    case light = "Light"
    case medium = "Medium"
    case rigid = "Rigid"
    case soft = "Soft"
}
