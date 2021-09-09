//
//  WalletHistory.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 16/08/21.
//

import SwiftUI

struct WalletHistory: View {
    var body: some View {
        ZStack{
            ARRRBackground().edgesIgnoringSafeArea(.all)
            VStack{
                VStack(alignment: .center, spacing: 10) {
                    Text("Wallet History").multilineTextAlignment(.center).foregroundColor(.gray)
                }
                
                HStack{
                
                    Text("Balance").foregroundColor(.gray)
                    
                }
                HStack{
                    Text("0.000258").foregroundColor(.gray)
                    Text("ARRR").foregroundColor(.yellow).font(.footnote)
                    
                }
            }
        }
    }
}

struct WalletHistory_Previews: PreviewProvider {
    static var previews: some View {
        WalletHistory()
    }
}
