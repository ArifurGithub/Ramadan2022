//
//  ContentView.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import SwiftUI

class ContentViewProtocol: ObservableObject{
    @Published var doyaScreenPressed: Bool = false
    @Published var fullSchedulePressed = false
    @Published var selectDistrictPressed = false
}

struct ContentView: View{
    @ObservedObject var contentProtocol: ContentViewProtocol = ContentViewProtocol()
    var nameEng = ""
    var nameBn = ""
    var code = ""
    
    
    @EnvironmentObject var network: Network
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    @State private var isDohaButtonSelected = false
    let dohaScreen = DohaScreen()
    let screenSize: CGRect = UIScreen.main.bounds
    
    
    @State private var isFullRamadanTimeSelected = false
    let fullRamadanDetails = FullTimeChartScreen()
    
    @ObservedObject var viewModel: MainViewModel
    init(nameEng: String, nameBn: String, code: String) {
            UITableView.appearance().showsVerticalScrollIndicator = false
        self.viewModel = MainViewModel()
        self.nameEng = nameEng
        self.nameBn = nameBn
        self.code = code
        }
    var body: some View {
        switch viewModel.state {
        case .idle:
            // Render a clear color and start the loading process
            // when the view first appears, which should make the
            // view model transition into its loading state:
            Color.clear.onAppear(perform: viewModel.loadDetails)
                .onAppear{
                    network.getFullRamadanList(districtCode: "22001")
                }
        case .loading:
            ProgressView("Loading Details...")
        case .failed(let error):
            ZStack{
                Image("main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack{
                    Text(error.localizedDescription)
                    Button("Retry") {
                        viewModel.loadDetails()
                    }
                    .padding(8)
                    .background(Color.yellow)
                    .foregroundColor(.white)
                    .cornerRadius(8)
                }
            }
            .navigationBarTitle("Movie List")
            .navigationBarTitleDisplayMode(.inline)
        case .loaded(let detailsData):
            let screenWidth = self.screenSize.width - 32
            ZStack{
                Image("main_bg")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                VStack(){
                    HStack{
                        Text("মাহে রমজান")
                            .font(.title)
                            .foregroundColor(.white)
                        Image("ovocal-d")
                            .resizable()
                            .frame(width: 200)
                            .scaledToFit()
                    }
                    HStack{
                        Image("sunrise")
                            .resizable()
                            .frame(width: 72)
                            .scaledToFit()
                        VStack{
                            Text("সূর্যোদয়")
                                .font(.title3)
                                .foregroundColor(.white)
                            Text(detailsData.data.timings.sunrise)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        Image("sunset")
                            .resizable()
                            .frame(width: 72)
                            .scaledToFit()
                        VStack{
                            Text("সূর্যাস্ত")
                                .font(.title3)
                                .foregroundColor(.white)
                            Text(detailsData.data.timings.sunset)
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color(UIColor.midnightblue))
                    .border(Color.teal, width: 1)
                    .shadow(color: .teal, radius: 2)
                    
                    VStack{
                        Text("আজ \(network.currentDayRamadanDetails.weekDay)")
                            .font(.title3)
                            .foregroundColor(.white)
                        Text("\(network.currentDayRamadanDetails.banglaDate), \(network.currentDayRamadanDetails.engDate)")
                            .font(.title3)
                            .foregroundColor(.white)
                        Text(network.currentDayRamadanDetails.ramadanDate)
                            .font(.title3)
                            .foregroundColor(.white)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color(UIColor.midnightblue))
                    .border(Color.teal, width: 1)
                    .shadow(color: .teal, radius: 2)
                    
                    HStack{
                        VStack{
                            Text("পরবর্তী সেহেরীর")
                                .font(.title3)
                                .foregroundColor(.white)
                            Text("শেষ সময়")
                                .font(.title3)
                                .foregroundColor(.white)
                            Spacer()
                            Text(network.currentDayRamadanDetails.sehri.replacingOccurrences(of: ":00", with: ""))
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(width: 132 , height: 80, alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                        
                        VStack{
                            Text("আজকের")
                                .font(.title3)
                                .foregroundColor(.white)
                            Text("ইফতারের সময়")
                                .font(.title3)
                                .foregroundColor(.white)
                            Spacer()
                            Text(network.currentDayRamadanDetails.iftar.replacingOccurrences(of: ":00", with: ""))
                                .font(.title3)
                                .foregroundColor(.white)
                        }
                        .frame(width: 132, height: 80,alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    
                    VStack{
                        Text("নামাজের সময় সূচি")
                            .font(.title3)
                            .foregroundColor(.white)
                        HStack{
                            Text("ফজর")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            Text(detailsData.data.timings.fajr)
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            
                        }
                        HStack{
                            Text("জোহর")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            Text(detailsData.data.timings.dhuhr)
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            
                        }
                        HStack{
                            Text("আসর")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            Text(detailsData.data.timings.asr)
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            
                        }
                        HStack{
                            Text("মাগরিব")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            Text(detailsData.data.timings.maghrib)
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            
                        }
                        HStack{
                            Text("ঈশা")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            Text(detailsData.data.timings.isha)
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(width: 132,alignment: .center)
                                .padding(8)
                                .background(Color(UIColor.midnightblue))
                                .border(Color.teal, width: 1)
                            
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding()
                    .background(Color(UIColor.midnightblue))
                    .border(Color.teal, width: 1)
                    .shadow(color: .teal, radius: 2)
                    
                    
                    Spacer()
                    
                    HStack{
                        Button("সূম্পর্ণ সূচি"){
                            isFullRamadanTimeSelected = true
                        }
                        .font(.custom("", size: 14))
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                            .border(Color.teal, width: 1)
                        Button("দোয়া"){
                            isDohaButtonSelected = true
                        }
                        .font(.custom("", size: 14))
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                            .border(Color.teal, width: 1)
                        Button("জেলা পরিবর্তন"){
                            self.mode.wrappedValue.dismiss()
                        }
                        .font(.custom("", size: 14))
                        .foregroundColor(.white)
                        .frame(alignment: .center)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                            .border(Color.teal, width: 1)
                        
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    NavigationLink(destination: dohaScreen,
                                                   isActive: $isDohaButtonSelected,
                                   label: { EmptyView() })
                    NavigationLink(destination: fullRamadanDetails,
                                                   isActive: $isFullRamadanTimeSelected,
                                   label: { EmptyView() })
                    NavigationLink(destination: dohaScreen,
                                   isActive: $contentProtocol.doyaScreenPressed,
                                   label: { EmptyView() })
                    
                    
                }
                .frame(width: screenWidth, alignment: .center)
                
            }
            .navigationBarHidden(true)
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
            .frame(maxWidth: .infinity)
            
        }
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(nameEng: "", nameBn: "", code: "")
            .environmentObject(Network())
    }
}
