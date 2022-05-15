import SwiftUI

struct TestView: View {
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
        ZStack {
            Color("BgColor")
                .ignoresSafeArea()
            
            VStack {
                VStack(spacing: 18) {
                    HStack {
                        Text("Budgeer")
                            .font(.system(size: 40))
                            .fontWeight(.bold)
                            .padding(20)
                            .foregroundColor(Color("LogoColor"))
                        
                        Spacer()
                        Spacer()
                        Spacer()
                        
                        Button {
                            showingAddExpence = true
                        } label: {
                            Image(systemName: "plus")
                                .font(.system(size: 25))
                        }
                        .sheet(isPresented: $showingAddExpence) {
                            AddView(expences: expences)
                        }
                        
                        Spacer()
                    }
                    
                    VStack {
                        HStack {
                            Text("Your expenses for all time: ")
                                .font(.system(size: 20))
                                .fontWeight(.semibold)
                        }
                        
                        HStack {
                            Text(totalSum, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                        }
                    }
                    .frame(width: 330, height: 50, alignment: .center)
                    .cornerRadius(20)
                    .padding(10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                        
                        List {
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
                            }
                        }
        
                }
                
                Spacer()
            }
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        expences.items.remove(atOffsets: offsets)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView(expences: Expences())
    }
}
