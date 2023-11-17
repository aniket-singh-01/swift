import Foundation

class DataManager {
    static let shared = DataManager()

    private let userDefaults = UserDefaults.standard
    private let textsKey = "savedTexts"

    func saveText(_ text: TextModel) {
        var savedTexts = fetchTexts()
        savedTexts.append(text)

        if let encodedData = try? JSONEncoder().encode(savedTexts) {
            userDefaults.set(encodedData, forKey: textsKey)
        }
    }

    func fetchTexts() -> [TextModel] {
        if let savedData = userDefaults.data(forKey: textsKey),
            let texts = try? JSONDecoder().decode([TextModel].self, from: savedData) {
            return texts
        }
        return []
    }

    func getRandomText() -> TextModel? {
        let texts = fetchTexts()
        return texts.randomElement()
    }
}
