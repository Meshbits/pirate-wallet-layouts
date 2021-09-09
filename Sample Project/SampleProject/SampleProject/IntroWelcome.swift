//
//  IntroWelcome.swift
//  SampleProject
//
//  Created by Lokesh Sehgal on 02/08/21.
//

import SwiftUI

struct IntroWelcome: View {
    @Environment(\.presentationMode) var presentationMode
    @State var animateForwardOrBackward = false
    @State var isViewVisible = false
    var body: some View {
         NavigationView
         {
            ZStack{
                ARRRBackground()
                
                        VStack(alignment: .center, content: {
                            Text("Welcome to Pirate Wallet").font(.title).padding(.trailing,80).padding(.leading,80).foregroundColor(.white).multilineTextAlignment(.center)
                            Text("Reliable, fast & Secure").padding(.trailing,80).padding(.leading,80).foregroundColor(.white).multilineTextAlignment(.center).foregroundColor(.gray).padding(.top,20)
                            ZStack{
                                Image("backgroundglow")
                                    .padding(.trailing,80).padding(.leading,80)
                                
                                HStack(alignment: .center, spacing: -30, content: {
                                    withAnimation(Animation.linear(duration: 4).delay(4).repeatForever(autoreverses: true)){
                                        Image("skullcoin")
                                            .offset(y: isViewVisible ? 40:0)
//                                            .transformEffect(CGAffineTransform(translationX: 0, y: isViewVisible ?40:0))
                                            .animation(Animation.linear(duration: 4).delay(4).repeatForever(autoreverses: true), value: isViewVisible)
                                    }
                                    
//                                    let transform = CGAffineTransform(translationX: isViewVisible ? 0 : 0, y: isViewVisible ? -100 : 0)
//.transformEffect(transform)
                                    
                                    
//                                    let transform = CGAffineTransform.identity.translatedBy(x: isViewVisible ? -10 : 0, y: isViewVisible ? -50 : 0).rotated(by: isViewVisible ? -25 : 0)

                                    Image("coin").padding(.top,50)
                                        .rotationEffect(Angle(degrees: isViewVisible ? -40 : 0))
//                                        .transition(.move(edge: .top))
                                        .animation(Animation.linear(duration: 4).delay(4).repeatForever(autoreverses: true), value: isViewVisible)
                                        .onAppear {
                                        withAnimation(.linear){
                                            DispatchQueue.main.asyncAfter(deadline:.now()+4){
                                                isViewVisible = true
                                            }
                                        }
                                    }
                                    
//                                    Image("coin").padding(.top,50)   .rotationEffect(Angle(degrees: isViewVisible ? -25 : 0))
//                                        .animation(Animation.linear(duration: 1).delay(1).repeatForever(autoreverses: true), value: isViewVisible)
//                                        .transition(.opacity)
//                                        .onAppear {
//                                        withAnimation(.linear){
//                                            DispatchQueue.main.asyncAfter(deadline:.now()+2){
//                                                isViewVisible = true
//                                            }
//                                        }
//                                    }

                                })
                            }
                            GetStartedButtonView()
                        })

                    }.edgesIgnoringSafeArea(.all)
                .navigationBarBackButtonHidden(true)
                .navigationTitle("Recovery Phrase")
                    .navigationBarTitleDisplayMode(.inline)
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
         }.onAppear(){
//            withAnimation(.spring(response: 1, dampingFraction: 1, blendDuration: 1)){
//                DispatchQueue.main.asyncAfter(deadline:.now()+2){
//                    isViewVisible = true
//                }
//            }
         }
    }
}

public extension View {
    func offset(x: CGFloat, y: CGFloat) -> some View {
        return modifier(_OffsetEffect(offset: CGSize(width: x, height: y)))
    }

    func offset(_ offset: CGSize) -> some View {
        return modifier(_OffsetEffect(offset: offset))
    }
}

struct IntroWelcome_Previews: PreviewProvider {
    static var previews: some View {
        IntroWelcome()
    }
}


struct ARRRBackground: View {
    var backgroundColor: Color = Color.init(red: 0.13, green: 0.14, blue: 0.15)
    var colors: [Color] = [Color.init(red: 0.13, green: 0.14, blue: 0.15), Color.init(red: 0.11, green: 0.12, blue: 0.14)]
    
    var showGradient = true
    func radialGradient(radius: CGFloat, center: UnitPoint = .center) -> some View {
        let gradientColors = Gradient(colors: colors)
        
        let conic = RadialGradient(gradient: gradientColors, center: center, startRadius: 0, endRadius: radius)
        return conic
        
    }
    
    var body: some View {
        GeometryReader { geometry in
            
            ZStack {
                self.backgroundColor
                
                if self.showGradient {
                    self.radialGradient(
                        radius: max(geometry.size.width, geometry.size.height),
                        center: UnitPoint(
                            x: 0.5,
                            y: 0.3
                        )
                    )
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
}


struct GetStartedButtonView : View {
    var body: some View {
        ZStack {
            
            Image("bluebuttonbackground").resizable().fixedSize().frame(width: 225.0, height:84).padding(.top,5)
            
            Text("Get Started").foregroundColor(Color.black)
                .frame(width: 225.0, height:84)
                .cornerRadius(15)
                .multilineTextAlignment(.center)
        }.frame(width: 225.0, height:84)
        
    }
}

