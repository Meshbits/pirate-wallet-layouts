//
//  ContentView.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 12/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            
            VStack(alignment: .center, spacing: 10, content: {
                PirateWalletCenterImageView().padding(.top,50)
                Spacer()
                BottomLayoutView()
                CreateWalletView()
                Spacer()
            }).background(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.13, green: 0.14, blue: 0.15), Color.init(red: 0.11, green: 0.12, blue: 0.14)]), startPoint: .top, endPoint: .bottom))).edgesIgnoringSafeArea(.all)
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct PirateWalletCenterImageView : View {
    var body: some View {
        HStack(alignment: .center, spacing: nil, content: {
            Spacer()
            Image("splashicon").padding(.horizontal)
            Spacer()
        })
    }
}

struct iCloudBackupAndRecoveryPhaseView : View {
    var body: some View {
        VStack(alignment: .leading, spacing: nil, content: {
            Text("Restore From").foregroundColor(Color.white)
        })
    }
}

struct BottomLayoutView: View {
    
    var body: some View {
        
//        iCloudBackupAndRecoveryPhaseView().multilineTextAlignment(.leading)
        
        ZStack {
          

            
            VStack(alignment: .center, spacing: 10.0, content: {
                
                ZStack {
                    
                    Image("buttonbackground").resizable().fixedSize().frame(width: 225.0, height:84).padding(10)
                    
                    Text("iCloud Backup").foregroundColor(Color.init(red: 132/255, green: 124/255, blue: 115/255))
                        .frame(width: 225.0, height:84).padding(10)
                        .cornerRadius(15)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                }.frame(width: 225.0, height:84)
                
                ZStack {
                    
                    Image("buttonbackground").resizable().fixedSize().frame(width: 225.0, height:84).padding(10)
                    
                    Text("Recovery Phase").foregroundColor(Color.init(red: 132/255, green: 124/255, blue: 115/255))
                        .frame(width: 225.0, height:84).padding(10)
                        .cornerRadius(15)
                        .font(.system(size: 16))
                        .multilineTextAlignment(.center)
                }.frame(width: 225.0, height:84)
                
            }).padding(50)
            .background(Rectangle().fill(LinearGradient(gradient: Gradient(colors: [Color.init(red: 0.13, green: 0.14, blue: 0.15), Color.init(red: 0.11, green: 0.12, blue: 0.14)]), startPoint: .top, endPoint: .bottom)))
            .cornerRadius(10)
            .shadow(color: Color.gray, radius: 1, x: 0, y: 0)
        }.padding()
        
    }
}

struct CreateWalletView : View {
    var body: some View {
        ZStack {
            
            Image("bluebuttonbackground").resizable().fixedSize().frame(width: 225.0, height:84).padding(10)
            
            Text("Create New Wallet").foregroundColor(Color.black)
                .frame(width: 225.0, height:84).padding(10)
                .cornerRadius(15)
                .font(.system(size: 16))
                .multilineTextAlignment(.center)
        }.frame(width: 225.0, height:84)
        
    }
}

