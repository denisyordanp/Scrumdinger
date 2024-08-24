//
//  ScrumdingerApp.swift
//  Scrumdinger
//
//  Created by Denis Yordan Panggabean on 24/08/24.
//

import SwiftUI

@main
struct ScrumdingerApp: App {
    var body: some Scene {
        WindowGroup {
            ScrumsView(scrums: DailyScrum.sampleData)
        }
    }
}
