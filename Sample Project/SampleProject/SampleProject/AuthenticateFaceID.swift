//
//  AuthenticateFaceID.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 02/09/21.
//

import SwiftUI


struct AuthenticateFaceID: View {
    
    var body: some View {
        ZStack{
            ARRRBackground().edgesIgnoringSafeArea(.all)
            VStack{
                Text("Authenticate Face ID").padding(.trailing,30).padding(.leading,30).foregroundColor(.white).multilineTextAlignment(.center).lineLimit(nil).padding(.top,20)
                Text("Login quickly using your Face ID").padding(.trailing,60).padding(.leading,60).foregroundColor(.gray).multilineTextAlignment(.center).foregroundColor(.gray).padding(.top,10)
                
                Spacer(minLength: 10)

                Spacer(minLength: 10)
             
                HStack{
                    
                    RecoveryWalletButtonView(imageName: Binding.constant("buttonbackground"), title: Binding.constant("Skip")).onTapGesture {
                        
                    }
                    
                    BlueButtonView(aTitle: "Allow").onTapGesture {
                        // Initiate Authentication flow
                    }
                }
                
            }
           
        }.navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct AuthenticateFaceID_Previews: PreviewProvider {
    static var previews: some View {
        AuthenticateFaceID()
    }
}

struct RecoveryWalletButtonView : View {
    
    @Binding var imageName: String
    @Binding var title: String

    
    
    var body: some View {
        ZStack {

            Image(imageName).resizable().frame(width: 145.0, height:84).padding(.top,5)
            
            Text(title).foregroundColor(Color.init(red: 132.0/255.0, green: 124.0/255.0, blue: 115.0/255.0))
                .frame(width: 145.0, height:84).padding(10)
                .cornerRadius(15)
                .multilineTextAlignment(.center)
        }.frame(width: 145.0, height:84)
    }
}


struct BlueButtonView : View {
    
    @State var aTitle: String = ""
    
    var body: some View {
        ZStack {
            
            Image("bluebuttonbackground").resizable().frame(width: 145.0, height:84).padding(.top,5)
            
            Text(aTitle).foregroundColor(Color.black)
                .frame(width: 145.0, height:84)
                .cornerRadius(15)
                .multilineTextAlignment(.center)
        }.frame(width: 145.0, height:84)
        
    }
}
