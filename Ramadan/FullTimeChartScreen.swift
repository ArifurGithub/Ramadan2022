//
//  FullTimeChartScreen.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 20/3/22.
//

import SwiftUI

struct FullTimeChartScreen: View {
    @ObservedObject var viewModel: MainViewModel
    var districtNameBn = "ঢাকা"
    var districtNameEn = "Dhaka"
    var districtCode = "22001"
    
    
    
    init() {
            UITableView.appearance().showsVerticalScrollIndicator = false
        self.viewModel = MainViewModel()
        }
    var body: some View {
        switch viewModel.stateFullRamadan {
        case .idle:
            // Render a clear color and start the loading process
            // when the view first appears, which should make the
            // view model transition into its loading state:
            Color.clear.onAppear(perform: viewModel.loadFullRamadanDetails)
        case .loading:
            ProgressView("সম্পূর্ণ সময়সূচি লোড হচ্ছে...")
        case .failed(let error):
            ZStack{
                Image("main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Text(error.localizedDescription)
                    Button("Retry") {
                        viewModel.loadFullRamadanDetails()
                    }
                    .padding(8)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
        case .loaded(let fullDetails):
            ZStack{
                Image("main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack(spacing: 8){
                    HStack{
                        Text("মাহে রমজান")
                            .font(.title)
                            .foregroundColor(.white)
                        Image("ovocal-d")
                            .resizable()
                            .frame(width: 200)
                            .scaledToFit()
                    }
                    Text("\(districtNameBn) জেলার সময় সূচি")
                        .font(.title2)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                    HStack{
                        Text("দশক")
                            .font(.custom("", size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                        
                        Text("তারিখ")
                            .font(.custom("", size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                        Text("সেহরি")
                            .font(.custom("", size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: 100, alignment: .center)
                        Text("ইফতারি")
                            .font(.custom("", size: 14))
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    .frame(width: 320, alignment: .leading)
                    .padding()
                    .background(Color(UIColor.midnightblue))
                    .border(Color.teal, width: 1)
                    .shadow(color: .teal, radius: 2)
                    ScrollView{
                        VStack{
                            ForEach(0..<fullDetails.data[0].distRamadanDetails.count) { number in
                                let rowData = fullDetails.data[0].distRamadanDetails[number]
                                
                                HStack{
                                    Text(rowData.ramadanPeriod)
                                        .font(.custom("", size: 14))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    VStack{
                                        Text(rowData.engDate)
                                            .font(.custom("", size: 14))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        
                                        Text(rowData.banglaDate)
                                            .font(.custom("", size: 14))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                        Text(rowData.ramadanDate)
                                            .font(.custom("", size: 14))
                                            .foregroundColor(.white)
                                            .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                    .frame(width: 100, alignment: .center)
                                    Text(rowData.sehri.replacingOccurrences(of: ":00", with: ""))
                                        .font(.custom("", size: 14))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    Text(rowData.iftar.replacingOccurrences(of: ":00", with: ""))
                                        .font(.custom("", size: 14))
                                        .foregroundColor(.white)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                }
                                .frame(width: 320, alignment: .leading)
                                .padding()
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                                .shadow(color: .teal, radius: 2)
                            }
                            }
                    }
                    .frame(maxHeight: .infinity)
                    Spacer()
                    HStack{
                        Button("সূম্পর্ণ সূচি"){
                            
                        }
                        .font(.custom("", size: 14))
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                            .border(Color.teal, width: 1)
                        Button("দোয়া"){
                        }
                        .font(.custom("", size: 14))
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                            .border(Color.teal, width: 1)
                        Button("জেলা পরিবর্তন"){
                            
                        }
                        .font(.custom("", size: 14))
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                            .border(Color.teal, width: 1)
                        
                    }
                    .frame(width: 320, alignment: .center)
                }
                .frame(maxWidth: .infinity)
                
            }
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            
    }
}
}

struct FullTimeChartScreen_Previews: PreviewProvider {
    static var previews: some View {
        FullTimeChartScreen()
    }
}
