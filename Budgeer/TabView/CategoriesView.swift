import SwiftUI

struct CategoriesView: View {
    @StateObject var expences = Expences()
    @State private var showingHousingExpence = false
    @State private var showingShoppingExpence = false
    @State private var showingFoodDrinksExpence = false
    @State private var showingTransportationExpence = false
    @State private var showingLifeEntertainmentExpence = false
    @State private var showingCommunicationDevicesExpence = false
    @State private var showingOtherExpence = false

    
    let types = ["🏠Housing", "🛍️Shopping", "🥪Food & Drinks", "🚋Transportation", "🎉Life & Entertainment", "💻Communication & Devices", "📄Other"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button("Housing expences") {
                        showingHousingExpence = true
                    } .sheet(isPresented: $showingHousingExpence) {
                        HousingView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Shopping expences") {
                        showingShoppingExpence = true
                    } .sheet(isPresented: $showingShoppingExpence) {
                        ShoppingView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Food & Drinks expences") {
                        showingFoodDrinksExpence = true
                    } .sheet(isPresented: $showingFoodDrinksExpence) {
                        FoodDrinksView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Transportation expences") {
                        showingTransportationExpence = true
                    } .sheet(isPresented: $showingTransportationExpence) {
                        TransportationView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Life & Entertainment expences") {
                        showingLifeEntertainmentExpence = true
                    } .sheet(isPresented: $showingLifeEntertainmentExpence) {
                        LifeEntertainmentView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Communication & Devices expences") {
                        showingCommunicationDevicesExpence = true
                    } .sheet(isPresented: $showingCommunicationDevicesExpence) {
                        ShoppingView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Other expences") {
                        showingOtherExpence = true
                    } .sheet(isPresented: $showingOtherExpence) {
                        OtherView(expences: expences)
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                } header: {
                    Text("Categories")
                        .font(.headline)
                }
            }
            .navigationTitle("Categories")
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        CategoriesView()
    }
}
