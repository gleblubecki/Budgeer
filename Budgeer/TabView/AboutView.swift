import SwiftUI

struct AboutView: View {
    let backgroundColor = Color("Background")
    
    var body: some View {
        NavigationView {
            ScrollView {
                
                VStack(alignment: .leading) {
                    Text("This app is written in the **Swift** language, created by Apple for development on their devices. And the main framework is **SwiftUI**.")
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("The **SwiftUI** framework was presented in 2019 at the WWDC conference. It includes a set of tools for creating a user interface that allows us to declaratively develop applications.")
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("The architectural pattern is MVVM. The data about the expenses are saved to the **Realm** database.")
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("**Realm** is a database that is focused on mobile devices.")
                        .fontWeight(.light)
                        .padding(.bottom)
                    Text("The main idea of the application is to manage your finances, the ability to see your expenses in various categories, track your spending, while seeing what the user spent money on and how large these purchases were.")
                        .fontWeight(.light)
                        .padding(.bottom)
                }
                .padding([.leading, .trailing])
                .padding(.top, 40)
            }
            .safeAreaInset(edge: .bottom) {
                Color.clear.frame(height: 70)
            }
            .background(backgroundColor.ignoresSafeArea())
            .navigationTitle("About App")
        }
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
