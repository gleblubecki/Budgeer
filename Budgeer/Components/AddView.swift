import SwiftUI
import RealmSwift

struct AddView: View {
    
    @Environment(\.managedObjectContext) var moc
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "🏠Housing"
    @State private var amount = 0.0
        
    let types = ["🏠Housing", "🛍️Shopping", "🥪Food & Drinks", "🚋Transportation", "🎉Entertainment", "💻Devices", "📄Other"]
   
    var body: some View {
        ZStack {
            NavigationView {
                Form {
                    TextField("Name", text: $name)
                    
                    Picker("Type", selection: $type) {
                        ForEach(types, id: \.self) {
                            Text($0)
                                .font(.system(size: 18))
                        }
                    }
                    
                    TextField("Amount", value: $amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                        .keyboardType(.decimalPad)
                }
                .navigationTitle("Add new expence")
                .toolbar {
                    Button("Save", action: addExpance)
                }
            }
        }
    }
    
    func addExpance() {
        let newExpence = Expence(context: moc)
        
        newExpence.id = UUID()
        newExpence.name = name
        newExpence.type = type
        newExpence.amount = amount
        
        try? moc.save()
        dismiss()
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView()
    }
}
