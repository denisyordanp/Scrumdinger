//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Denis Yordan Panggabean on 24/08/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    @State private var scrums: [DailyScrum] = DailyScrum.sampleData
    
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: $scrums)
        }
    }
}
