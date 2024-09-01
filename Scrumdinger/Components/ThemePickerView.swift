//
//  ThemePicker.swift
//  Scrumdinger
//
//  Created by Denis Yordan Panggabean on 25/08/24.
//

import SwiftUI

struct ThemePickerView: View {
    @Binding var selection: Theme
    
    var body: some View {
        Picker("Theme", selection: $selection) {
            ForEach(Theme.allCases) { theme in
                ThemeView(theme: theme)
                    .tag(theme)
            }
        }
        .pickerStyle(.navigationLink)
    }
}

#Preview {
    ThemePickerView(selection: .constant(Theme.local_bubblegum))
}
