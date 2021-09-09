//
//  PrivateServerConfig.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 15/08/21.
//

import SwiftUI

struct PrivateServerConfig: View {
    @State private var lightServerString: String = ""
    @State private var lightPortString: String = ""
    @Environment(\.presentationMode) var presentationMode
    @State var isFaceIdEnabled = false
    var body: some View {
        ZStack{
                ARRRBackground()
            VStack(alignment: .center, spacing: 10) {
                Spacer(minLength: 5)
                Text("Private Server Config").multilineTextAlignment(.center).foregroundColor(.white)
                
                VStack{
                    HStack {
                        Text("Auto Config").multilineTextAlignment(.center).foregroundColor(.white)
                        
                        Toggle("", isOn: $isFaceIdEnabled)
                            .toggleStyle(ColoredToggleStyle()).labelsHidden()
                    }
                    Divider().foregroundColor(.white).frame(height:10).padding()
                    
                    VStack(alignment: .leading, spacing: nil, content: {
                        Text("Chain lite server ").multilineTextAlignment(.leading).foregroundColor(.white)
                        TextField("lightd.meshbits.io", text: $lightServerString)
                        .modifier(BackgroundPlaceholderModifier())
                        Text("Port ").multilineTextAlignment(.leading).foregroundColor(.white)
                        TextField("9067", text: $lightPortString)
                        .modifier(BackgroundPlaceholderModifier())
                    }).modifier(ForegroundPlaceholderModifier())
                }
                .modifier(BackgroundPlaceholderModifier())
                
              
                Spacer()
            }
        }.edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
        .navigationTitle("").navigationBarTitleDisplayMode(.inline)
        .navigationBarItems(leading:  Button(action: {
            presentationMode.wrappedValue.dismiss()
        }) {
            VStack(alignment: .leading) {
                ZStack{
                    Image("passcodenumericbg")
                    Text("<").foregroundColor(.gray).bold().multilineTextAlignment(.center).padding([.bottom],8).foregroundColor(Color.init(red: 132/255, green: 124/255, blue: 115/255))
                }
            }.padding(.leading,-20).padding(.top,10)
        })
    }
}
//
//struct PrivateServerConfigCenterLayout : View {
//    var body: some View{
//
//    }
//}

struct PrivateServerConfig_Previews: PreviewProvider {
    static var previews: some View {
        PrivateServerConfig()
    }
}

struct BackgroundPlaceholderModifier: ViewModifier {

var backgroundColor = Color(.systemBackground)

func body(content: Content) -> some View {
    content
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 29.0/255.0, green: 32.0/255.0, blue: 34.0/255.0))
                .softInnerShadow(RoundedRectangle(cornerRadius: 12), darkShadow: Color.init(red: 0.06, green: 0.07, blue: 0.07), lightShadow: Color.init(red: 0.26, green: 0.27, blue: 0.3), spread: 0.05, radius: 2))
        .padding()
    }
}



struct ForegroundPlaceholderModifier: ViewModifier {

var backgroundColor = Color(.systemBackground)

func body(content: Content) -> some View {
    content
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 12).fill(Color.init(red: 29.0/255.0, green: 32.0/255.0, blue: 34.0/255.0))
                .softInnerShadow(RoundedRectangle(cornerRadius: 12), darkShadow: Color.init(red: 0.26, green: 0.27, blue: 0.3), lightShadow: Color.init(red: 0.06, green: 0.07, blue: 0.07), spread: 0.05, radius: 2))
        .padding()
    }
}
