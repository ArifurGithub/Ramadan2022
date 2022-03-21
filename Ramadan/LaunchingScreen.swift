//
//  LaunchingScreen.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import SwiftUI

struct LaunchingScreen: View {
    //Mark: State variables
    @State private var isActive = false
    let selectDistrict = SelectDistrictScreen()
    
    let appVersion = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("launching_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack(alignment: .trailing, spacing: 0){
                        Text("মাহে রমজান")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                        Image("ovocal-d")
                            .resizable()
                            .frame(width: 150, height: 50, alignment: .trailing)
                            .aspectRatio(contentMode: .fill)
                    }
                    .padding(32)
                    Spacer()
                    VStack{
                        Image("logo")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                        Text("Version \(Bundle.main.shortVersion)")
                            .font(.body)
                            .foregroundColor(.white)
                    }
                    .frame(height: 220)
                    
                    NavigationLink(destination: selectDistrict,
                                                   isActive: $isActive,
                                                   label: { EmptyView() })
                }.onAppear(perform: {
                    self.goToDistrictScreen(time: 2.5)
                })
                .frame(maxWidth: .infinity, maxHeight: .infinity)
            }
        }
    }
    
    //Mark: GO to District selection Screen after 2 second
    func goToDistrictScreen(time: Double) {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(time)) {
                self.isActive = true
            }
        }
}

struct LaunchingScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LaunchingScreen()
                .previewInterfaceOrientation(.portrait)
        }
    }
}
