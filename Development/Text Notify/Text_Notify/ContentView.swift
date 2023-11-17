// ContentView.swift
import SwiftUI

struct ContentView: View {
    @State private var inputText: String = ""
    @State private var texts: [TextModel] = DataManager.shared.fetchTexts()

    var body: some View {
        VStack {
            TextField("Enter text", text: $inputText)
                .padding()
            Button("Save") {
                let newText = TextModel(content: inputText)
                DataManager.shared.saveText(newText)
                texts = DataManager.shared.fetchTexts()
                inputText = "" // Clear the input field after saving
            }
            .padding()

            List {
                ForEach(texts, id: \.id) { text in
                    Text(text.content)
                }
            }

            // Example: Sending a notification
            TimerView(interval: 2*60*60) {
                if let randomText = self.texts.randomElement() {
                    NotificationManager.shared.sendNotification(
                        date: Date(),
                        type: "time",
                        timeInterval: 1, // Send immediately
                        title: "Notification",
                        body: randomText.content
                    )
                }
            }
        }
        .onAppear {
            // Requesting notification permissions
            UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .sound]) { granted, error in
                if granted {
                    print("Notification permissions granted.")
                } else if let error = error {
                    print("Notification permissions error: \(error.localizedDescription)")
                } else {
                    print("Notification permissions denied.")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TimerView: View {
    let interval: TimeInterval
    let action: () -> Void

    var body: some View {
        Text("")
            .onAppear {
                let _ = Timer.scheduledTimer(withTimeInterval: self.interval, repeats: true) { _ in
                    self.action()
                }
            }
    }
}
