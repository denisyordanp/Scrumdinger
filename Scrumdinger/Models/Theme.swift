//
//  Theme.swift
//  Scrumdinger
//
//  Created by Denis Yordan Panggabean on 24/08/24.
//

import SwiftUI

enum Theme : String {
    case local_bubblegum
    case local_buttercup
    case local_indigo
    case local_lavender
    case local_magenta
    case local_navy
    case local_orange
    case local_oxblood
    case local_periwinkle
    case local_poppy
    case local_purple
    case local_seafoam
    case local_sky
    case local_tan
    case local_teal
    case local_yellow
    
    var accentColor: Color {
        switch self {
        case .local_bubblegum, .local_buttercup, .local_lavender, .local_orange, .local_periwinkle, .local_poppy, .local_seafoam, .local_sky, .local_tan, .local_teal, .local_yellow: return .black
        case .local_indigo, .local_magenta, .local_navy, .local_oxblood, .local_purple: return .white
        }
    }
    
    var mainColor: Color {
        Color(rawValue)
    }
    
    var name: String {
        String(rawValue.dropFirst(6)).capitalized
    }
}
