import SwiftUI

struct ContentView: View {
    @StateObject var expences = Expences()
            
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            CategoriesView()
                .tabItem {
                    Label("Categories", systemImage: "list.bullet.rectangle.portrait.fill")
                }
//            AboutView()
//                .tabItem {
//                    Label("About App", systemImage: "menucard.fill")
//                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
