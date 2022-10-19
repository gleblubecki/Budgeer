import SwiftUI
import RealmSwift

struct CategoriesView: View {
    @State private var showingHousingExpence = false
    @State private var showingShoppingExpence = false
    @State private var showingFoodDrinksExpence = false
    @State private var showingTransportationExpence = false
    @State private var showingLifeEntertainmentExpence = false
    @State private var showingCommunicationDevicesExpence = false
    @State private var showingOtherExpence = false

    
    let types = ["🏠Housing", "🛍️Shopping", "🥪Food & Drinks", "🚋Transportation", "🎉Life & Entertainment", "💻Devices", "📄Other"]
    
    var body: some View {
        NavigationView {
            List {
                Section {
                    Button("Housing expences") {
                        showingHousingExpence = true
                    } .sheet(isPresented: $showingHousingExpence) {
                        HousingView()
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Shopping expences") {
                        showingShoppingExpence = true
                    } .sheet(isPresented: $showingShoppingExpence) {
                        ShoppingView()
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Food & Drinks expences") {
                        showingFoodDrinksExpence = true
                    } .sheet(isPresented: $showingFoodDrinksExpence) {
                        FoodDrinksView()
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Transportation expences") {
                        showingTransportationExpence = true
                    } .sheet(isPresented: $showingTransportationExpence) {
                        TransportationView()
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Entertainment expences") {
                        showingLifeEntertainmentExpence = true
                    } .sheet(isPresented: $showingLifeEntertainmentExpence) {
                        Entertainment()
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Devices") {
                        showingCommunicationDevicesExpence = true
                    } .sheet(isPresented: $showingCommunicationDevicesExpence) {
                        Devices()
                    }
                        .foregroundColor(.black)
                        .font(.headline)
                    
                    Button("Other expences") {
                        showingOtherExpence = true
                    } .sheet(isPresented: $showingOtherExpence) {
                        OtherView()
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

