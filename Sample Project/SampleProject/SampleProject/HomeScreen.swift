//
//  HomeScreen.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 07/08/21.
//

import SwiftUI

struct HomeScreen: View {

    init() {
            UITabBar.appearance().isTranslucent = false
            UITabBar.appearance().barTintColor = UIColor.init(Color.init(red: 0.13, green: 0.14, blue: 0.15))
        }
  
    var body: some View {
        TabView {
            ContentView()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image("walleticon").renderingMode(.template)
                    Text("Wallet")
                }
         
            IntroWelcome()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image("historyicon").renderingMode(.template)
                    Text("History")
                }
         
            PasscodeScreen()
                .font(.system(size: 30, weight: .bold, design: .rounded))
                .tabItem {
                    Image("settingsicon").renderingMode(.template)
                    Text("Settings")
                }
        }.accentColor(Color.init(red: 194.0/255.0, green: 136.0/255.0, blue: 101.0/255.0))
    }
}

struct HomeScreen_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreen()
    }
}
