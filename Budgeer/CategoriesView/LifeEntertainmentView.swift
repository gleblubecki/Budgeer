import SwiftUI

struct LifeEntertainmentView: View {
    @ObservedObject var expences: Expences
    @Environment(\.dismiss) var dismiss
    
    var totalSum: Double {
        var total = 0.0
        
        for item in expences.items {
            if item.type == "🎉Entertainment" {
                total += item.amount
            }
        }
        return total
    }
        
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Text(totalSum, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                }header: {
                    Text("Total")
                        .font(.subheadline)
                }
                
                Section {
                    ForEach(expences.items) { item in
                        if item.type == "🎉Entertainment" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                }
                                
                                Spacer()
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                    .fontWeight(item.amount < 10 ? .light : (item.amount < 100 ? .regular : .bold))
                                    .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("All expences")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Life & Entertainment")
            .toolbar {
                Button("Done") { dismiss() }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expences.items.remove(atOffsets: offsets)
    }
}

struct LifeEntertainmentView_Previews: PreviewProvider {
    static var previews: some View {
        LifeEntertainmentView(expences: Expences())
    }
}
