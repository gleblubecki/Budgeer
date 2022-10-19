import CoreData
import Foundation

class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "Budgeer")
    
    init () { 
        container.loadPersistentStores{ description, error in
            if let error = error {
                print("Загрузка CoreData не удалась. Ошибка: \(error.localizedDescription)")
            }
        }
    }
}
