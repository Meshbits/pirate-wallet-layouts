//
//  SettingsScreen.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 11/08/21.
//

import SwiftUI
import Neumorphic
//
//  SettingsScreen.swift
//  SettingsScreen
//
//  Created by Lokesh Sehgal on 08/08/21.
//  Copyright © 2021 Francisco Gindre. All rights reserved.
//

import SwiftUI

struct SettingsRowData : Equatable {
    var id: Int
    var title: String
}


enum SettingsDestination: Int {
    case openLanguage = 0
    case openNotifications = 1
    case handleFaceId = 2
    case openRecoveryPhrase = 3
    case openChangePIN = 4
    case openPrivateServerConfig = 5
    case openiCloudBackup = 6
    case openPrivacyPolicy = 7
    case openTermsAndConditions = 8
    case openSupport = 9
}


struct SettingsScreen: View {
    
    var generalSection = [SettingsRowData(id:0,title:"Language"),
                          SettingsRowData(id:1,title:"Notifications")]
    var securitySection = [SettingsRowData(id:2,title:"Face ID"),
                           SettingsRowData(id:3,title:"Recovery Phrase"),
                           SettingsRowData(id:4,title:"Change PIN"),
                           SettingsRowData(id:5,title:"Unlink Device")]
    var walletSection = [SettingsRowData(id:6,title:"Private Server Config"),
                         SettingsRowData(id:7,title:"iCloud backup")]
    var aboutSection = [SettingsRowData(id:8,title:"Privacy Policy"),
                        SettingsRowData(id:9,title:"Terms & Conditions"),
                        SettingsRowData(id:10,title:"Support")]
   
    @State var destination: SettingsDestination?
    
    @State var mSelectedSettingsRowData: SettingsRowData?
    
    var body: some View {
            ZStack{
                ARRRBackground().edgesIgnoringSafeArea(.all)
                
                VStack(alignment: .center, spacing: 10) {
                    Spacer(minLength: 5)
                    Text("Settings").multilineTextAlignment(.center).foregroundColor(.white)
                        
                    ScrollView {

                        VStack {
                            ForEach(generalSection, id: \.id) { settingsRowData in
                                VStack {
                                    Text(settingsRowData.title).foregroundColor(.white)
                                                    .frame(width: 230, height: 22,alignment: .leading)
                                                    .foregroundColor(Color.white)
                                        .padding(.trailing, 100)
                                        .padding()
                                    
                                    if settingsRowData.id < 1 {
                                        Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                                    }
                                }
                            }
                            
                        }
                        .modifier(CardViewModifier())
                        
                        
                        VStack {
                            ForEach(securitySection, id: \.id) { settingsRowData in
                                VStack {
                                    Text(settingsRowData.title).foregroundColor(.white)
                                                    .frame(width: 230, height: 22,alignment: .leading)
                                                    .foregroundColor(Color.white)
                                        .padding(.trailing, 100)
                                        .padding()
                                    
                                    if settingsRowData.id < 5 {
                                        Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                                    }
                                }
                            }
                            
                        }
                        .modifier(CardViewModifier())
                        
                        VStack {
                            ForEach(walletSection, id: \.id) { settingsRowData in
                                VStack {
                                    Text(settingsRowData.title).foregroundColor(.white)
                                                    .frame(width: 230, height: 22,alignment: .leading)
                                                    .foregroundColor(Color.white)
                                        .padding(.trailing, 100)
                                        .padding()
                                    if settingsRowData.id < 7 {
                                        Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                                    }
                                }
                            }
                            
                        }
                        .modifier(CardViewModifier())
                        
                        VStack {
                            ForEach(aboutSection, id: \.id) { settingsRowData in
                                VStack {
                                    Text(settingsRowData.title).foregroundColor(.white)
                                                    .frame(width: 230, height: 22,alignment: .leading)
                                                    .foregroundColor(Color.white)
                                        .padding(.trailing, 100)
                                        .padding()
                                    if settingsRowData.id < 10 {
                                        Color.gray.frame(height:CGFloat(1) / UIScreen.main.scale)
                                    }
                                }
                            }
                            
                        }
                        .modifier(CardViewModifier())
                    }
                    .background(Color.init(red: 33.0/255.0, green: 36.0/255.0, blue: 38.0/255.0))
          
                    .onTapGesture {
                        self.destination = SettingsDestination(rawValue: self.mSelectedSettingsRowData?.id ?? 0)
                    }
                }
            }.onAppear() {
                UITableView.appearance().backgroundColor = UIColor.init(Color.init(red: 25.0/255.0, green: 28.0/255.0, blue: 29.0/255.0))
            }
    }
    
}


struct SettingsSectionHeaderView : View {
    @State var aTitle: String = ""

    var body: some View {
        
        ZStack {
            Text(aTitle).foregroundColor(Color.init(red: 107.0/255.0, green: 110.0/255.0, blue: 118.0/255.0))
        }
    }
}

struct SettingsRow: View {

    var mCurrentRowData:SettingsRowData

    @Binding var mSelectedSettingsRowData: SettingsRowData?
        
    var body: some View {
        
        ZStack {
            Text(mCurrentRowData.title).foregroundColor(.white)
                            .frame(width: 230, height: 22,alignment: .leading)
                            .foregroundColor(Color.white)
                .padding(.trailing, 100)
        }
        .onTapGesture {
            self.mSelectedSettingsRowData = self.mCurrentRowData
        }
    }
}

struct SettingsRowBackground: View {
    var body: some View{
        
//        ZStack{
//            Rectangle().fill(Color.init(red: 25.0/255.0, green: 28.0/255.0, blue: 29.0/255.0))
//                .shadow(color: Color.init(red: 25.0/255.0, green: 28.0/255.0, blue: 29.0/255.0).opacity(0.7), radius: 10, x: -5, y: -5)

            Rectangle().fill(Color.init(red: 25.0/255.0, green: 28.0/255.0, blue: 29.0/255.0)).softInnerShadow(Rectangle(),spread: 0.1,radius: 1).padding(2)

            
//        Rectangle().fill(Color.init(red: 25.0/255.0, green: 28.0/255.0, blue: 29.0/255.0))
//            .overlay(
//                RoundedRectangle(cornerRadius: 1)
//                    .stroke(Color.init(red: 25.0/255.0, green: 28.0/255.0, blue: 29.0/255.0), lineWidth: 1)
//
//            )
            
//        }
    }
}


struct SettingsScreen_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreen()
    }
}
