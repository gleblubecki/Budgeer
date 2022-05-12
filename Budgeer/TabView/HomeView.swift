import SwiftUI

struct HomeView: View {
    @StateObject var expences = Expences()
    @State private var showingAddExpence = false
    
    var totalSum: Double {
        var total = 0.0
        
        for item in expences.items {
            total += item.amount
        }
        return total
    }
    
    var body: some View {
        
            NavigationView {
                List {
                    Section {
                        HStack(alignment: .center) {
                            Text(totalSum, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .fontWeight(.semibold)
                        }
                    }  header: {
                        Text("Your expenses for all time")
                            .font(.subheadline)
                    }
                    
                    Section {
                        ForEach(expences.items) { item in
                            HStack {
                                VStack(alignment: .leading) {
                                    Text(item.name)
                                        .font(.headline)
                                    Text(item.type)
                                }
                                
                                Spacer()
                                
                                Rectangle()
                                    .frame(width: 5, height: 30)
                                    .cornerRadius(10)
                                    .foregroundColor(item.amount < 10 ? .green : (item.amount < 100 ? .orange : .red))
                                
                                Text(item.amount, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                
                            }
                        }
                        .onDelete(perform: removeItems)
                    } header: {
                        Text("Recent expences")
                            .font(.subheadline)
                    }
                }
                .navigationTitle("Budgeer")
                .toolbar {
                    Button {
                        showingAddExpence = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
                .sheet(isPresented: $showingAddExpence) {
                    AddView(expences: expences)
                }
            }
        }
    
    func removeItems(at offsets: IndexSet) {
        expences.items.remove(atOffsets: offsets)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(expences: Expences())
            .previewInterfaceOrientation(.portrait)
    }
}
