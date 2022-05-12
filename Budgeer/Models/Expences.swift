import Foundation

class Expences: ObservableObject {
    @Published var items = [ExpenceItem]() {
        didSet {
            if let encoded = try? JSONEncoder().encode(items) {
                UserDefaults.standard.set(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodedItems = try? JSONDecoder().decode([ExpenceItem].self, from: savedItems) {
                items = decodedItems
                return
            }
        }
        
        items = []
    }
}
