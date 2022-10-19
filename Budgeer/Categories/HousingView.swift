import SwiftUI

struct HousingView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.date),
    ]) var expences: FetchedResults<Expence>
    
    @Environment(\.dismiss) var dismiss
            
    var totalSum: Double {
        var total = 0.0
        
        for expence in expences {
            if expence.type == "🏠Housing" {
                total += expence.amount
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
                    ForEach(expences) { expence in
                        if expence.type == "🏠Housing" {
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(expence.name ?? "Error")
                                        .font(.headline)
                                }

                                Spacer()

                                Rectangle()
                                    .frame(width: 5, height: 30)
                                    .cornerRadius(10)
                                    .foregroundColor(expence.amount < 10 ? .green : (expence.amount < 100 ? .orange : .red))

                                Text(expence.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                            }
                        }
                    }
                    .onDelete(perform: removeItems)
                } header: {
                    Text("All expences")
                        .font(.subheadline)
                }
            }
            .navigationTitle("Housing")
            .toolbar {
                Button("Done") { dismiss() }
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let expece = expences[offset]
            moc.delete(expece)
        }
        
        try? moc.save()
    }
}

struct HousingView_Previews: PreviewProvider {
    static var previews: some View {
        HousingView()
    }
}
