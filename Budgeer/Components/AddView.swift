import SwiftUI

struct AddView: View {
    @ObservedObject var expences: Expences
    @Environment(\.dismiss) var dismiss
        
    @State private var name = ""
    @State private var type = "🏠Housing"
    @State private var amount = 0.0
        
    let types = ["🏠Housing", "🛍️Shopping", "🥪Food & Drinks", "🚋Transportation", "🎉Life & Entertainment", "💻Communication & Devices", "📄Other"]
   
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
                    Button("Save") {
                        let item = ExpenceItem(name: name, type: type, amount: amount)
                        expences.items.append(item)
                        dismiss()
                    }
                }
            }
        }
    }
}

struct AddView_Previews: PreviewProvider {
    static var previews: some View {
        AddView(expences: Expences())
    }
}
