//
//  SettingsScreenNew.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 13/08/21.
//

import SwiftUI
import Neumorphic
import BottomSheet
struct SettingsScreenNew: View {
    let data = ["Language", "Notifications"]
    @State var showGreeting = false
        var body: some View {

            ZStack{
                ARRRBackground()
                ScrollView {

                    VStack {
                        ForEach(data, id:\.self) { row in
                            VStack {
                                HStack{
                                    Text(row).foregroundColor(.white)
                                                    .frame(width: 230, height: 22,alignment: .leading)
                                                    .foregroundColor(Color.white)
                                        .padding(.trailing, 50)
                                        .padding().onTapGesture {
                                            showGreeting.toggle()
                                        }
                                    
                                }
                            }
                        }
                        
                    }
                    .modifier(CardViewModifier())
                    
                }
                .background(Color.init(red: 33.0/255.0, green: 36.0/255.0, blue: 38.0/255.0))
            }.bottomSheet(isPresented: $showGreeting,
                          height: 600,
                          topBarHeight: 0,
                          topBarCornerRadius: 16,
                          showTopIndicator: false) {
                SettingsScreen()
            }
        }
}

struct ColoredToggleStyle: ToggleStyle {
    var onColor = Color.init(red: 12.0/255.0, green: 38.0/255.0, blue: 48.0/255.0)
    var offColor = Color.init(red: 27.0/255.0, green: 30.0/255.0, blue: 32.0/255.0)
    var thumbOnColor = Color.init(red: 120.0/255.0, green: 176.0/255.0, blue: 193.0/255.0)
    var thumbOffColor = Color.init(red: 83.0/255.0, green: 94.0/255.0, blue: 97.0/255.0)
    
    func makeBody(configuration: Self.Configuration) -> some View {
        HStack {
            configuration.label // The text (or view) portion of the Toggle
            Spacer()
            RoundedRectangle(cornerRadius: 16, style: .circular)
                .fill(configuration.isOn ? onColor : offColor)
                .frame(width: 50, height: 29)
                .overlay(
                    Circle()
                        .fill(configuration.isOn ? thumbOnColor : thumbOffColor)
                        .shadow(radius: 1, x: 0, y: 1)
                        .padding(1.5)
                        .offset(x: configuration.isOn ? 10 : -10))
                .animation(Animation.easeInOut(duration: 0.2))
                .onTapGesture { configuration.isOn.toggle() }
        }
        .font(.title)
        .padding(.horizontal)
    }
}

struct CardViewModifier: ViewModifier {

var backgroundColor = Color(.systemBackground)

func body(content: Content) -> some View {
    content
        .padding()
        .frame(maxWidth: .infinity)
        .background(
            RoundedRectangle(cornerRadius: 30).fill(Color.init(red: 29.0/255.0, green: 32.0/255.0, blue: 34.0/255.0))
                .softInnerShadow(RoundedRectangle(cornerRadius: 30), darkShadow: Color.init(red: 0.06, green: 0.07, blue: 0.07), lightShadow: Color.init(red: 0.26, green: 0.27, blue: 0.3), spread: 0.05, radius: 2))
        .padding()
    }
}
//RoundedRectangle(cornerRadius: 20).fill(Color.Neumorphic.main).softOuterShadow()
struct SettingsScreenNew_Previews: PreviewProvider {
    static var previews: some View {
        SettingsScreenNew()
    }
}
