//
//  DetailView.swift
//  Scrumdinger
//
//  Created by Denis Yordan Panggabean on 24/08/24.
//

import SwiftUI

struct DetailView: View {
    @Binding var scrum: DailyScrum
    
    @State private var editingScrum: DailyScrum = DailyScrum.emptyScrum
    @State private var isPresentingEditView = false
    
    var body: some View {
        List {
            Section(header: Text("Meeting info")) {
                NavigationLink(destination: MeetingView(scrum: $scrum)) {
                    Label("Start Meeting", systemImage: "timer")
                        .font(.headline)
                        .foregroundColor(.accentColor)
                }
                HStack {
                    Label("Length", systemImage: "clock")
                    Spacer()
                    Text("\(scrum.lengthInMinutes) minutes")
                }
                .accessibilityElement(children: .combine)
                HStack {
                    Label("Theme", systemImage: "paintpalette")
                    Spacer()
                    Text(scrum.theme.name)
                        .padding(4)
                        .foregroundColor(scrum.theme.accentColor)
                        .background(scrum.theme.mainColor)
                        .cornerRadius(4)
                }
                .accessibilityElement(children: .combine)
            }
            
            Section(header: Text("Attendees")) {
                ForEach(scrum.attendees) { attendee in
                    Label("\(attendee.name)", systemImage: "person")
                }
            }
        }
        .navigationTitle(scrum.title)
        .toolbar(content: {
            Button("Edit", action: {
                isPresentingEditView = true
                editingScrum = scrum
            })
        })
        .sheet(isPresented: $isPresentingEditView, content: {
            NavigationStack {
                DetailEditView(scrum: $editingScrum)
                    .navigationTitle(scrum.title)
                    .toolbar(content: {
                        ToolbarItem(placement: .cancellationAction, content: {
                            Button("Cancel", action: {
                                isPresentingEditView = false
                            })
                        })
                        ToolbarItem(placement: .confirmationAction, content: {
                            Button("Done", action: {
                                scrum = editingScrum
                                isPresentingEditView = false
                            })
                        })
                    })
            }
        })
    }
}

#Preview {
    return NavigationStack {
        DetailView(scrum: .constant(DailyScrum.sampleData[1]))
    }
}
