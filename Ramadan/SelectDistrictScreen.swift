//
//  SelectDistrictScreen.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import SwiftUI

struct SelectDistrictScreen: View {
    let districtList = DistrictList()
    
    @State private var selectedDistricPosition = 0
    
    
    @State private var isDistrictSelected = false
    
    @State private var selectedDistrict = ""
    
    @State private var selectedDistNameBn: String = ""
    @State private var selectedDistNameEn: String = ""
    @State private var selectedDistCode: String = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                Image("main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Spacer()
                    VStack(spacing: 0){
                        Text("মাহে রমজান")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        Image("ovocal-d")
                            .resizable()
                            .frame(width: 150, height: 50, alignment: .trailing)
                            .aspectRatio(contentMode: .fill)
                        HStack{
                            Button{
                                
                            } label: {
                                Text("জেলা নির্বাচন করুন")
                                    .foregroundColor(.white)
                            }
                            
                            
                           Picker("জেলা নির্বাচন করুন", selection: $selectedDistrict) {
                               ForEach(districtList.districtListBn, id: \.self) {
                                   Text($0)
                               }
                           }
                           .pickerStyle(MenuPickerStyle())
                            .onChange(of: selectedDistrict, perform: {newPosition in
                                print("New Position\(newPosition)")
                                let distPosition = districtList.districtListBn.firstIndex(where: {$0 == newPosition})
                                print("dist eng Name & code \(districtList.districtListEng[distPosition!]) & \(districtList.districtCode[distPosition!])")
                                selectedDistNameEn = districtList.districtListEng[distPosition!]
                                selectedDistNameBn = newPosition
                                selectedDistCode = String(districtList.districtCode[distPosition!])
                                ConstantValues.selectedDistCode = selectedDistCode
                                ConstantValues.selectedDistNameBn = selectedDistNameBn
                                ConstantValues.selectedDistNameEn = selectedDistNameEn
                                isDistrictSelected = true
                                
                            })
                            
                            .frame(width: 80)
                        }
                        .frame(width: 240, height: 32, alignment: .center)
                        .padding()
                        .background(.gray)
                        .border(.gray, width: 1)
                        .shadow(color: .gray, radius: 2)
                        
                    }
                    .frame(height: 200)
                    NavigationLink(destination: ContentView(nameEng: selectedDistNameEn, nameBn: selectedDistNameBn, code: selectedDistCode),
                                                   isActive: $isDistrictSelected,
                                   label: { EmptyView() })
                    Spacer()
                    Text("Version \(Bundle.main.shortVersion)")
                        .font(.body)
                        .foregroundColor(.white)
                        .frame(height: 90)
                }
            }
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarHidden(true)
    }
}

struct SelectDistrictScreen_Previews: PreviewProvider {
    static var previews: some View {
        SelectDistrictScreen()
    }
}
