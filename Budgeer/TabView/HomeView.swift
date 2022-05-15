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
        ZStack {
            Color("BgColor")
                .ignoresSafeArea()
            
            VStack {
                VStack {
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
                    
                    HStack {
                        Text("Your expenses for all time: ")
                            .font(.system(size: 25))
                            .fontWeight(.semibold)
                    }
                    
                    VStack {
                        HStack {
                            Text(totalSum, format: .currency(code: Locale.current.currencyCode ?? "USD"))
                                .font(.system(size: 20))
                                .fontWeight(.regular)
                        }
                    }
                    .frame(width: 200, height: 30, alignment: .center)
                    .cornerRadius(20)
                    .padding(10)
                    .background(.white)
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                    
                    List {
                        Section {
                            HStack {
                                Text("Recent expenses: ")
                                    .font(.system(size: 20))
                                    .fontWeight(.medium)
                                    .foregroundColor(Color("TitleColor"))
                            }
                            
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
