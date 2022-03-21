//
//  DohaScreen.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 19/3/22.
//

import SwiftUI

struct DohaScreen: View {
    @ObservedObject var contentProtocol: ContentViewProtocol = ContentViewProtocol()
    @Environment(\.presentationMode) var mode: Binding<PresentationMode>
    
    var body: some View {
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
                ScrollView{
                    VStack{
                        VStack{
                            Text("রোজার নিয়ত")
                                .font(.title3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("ويت ان اصوم غدا من شهر رمضان المبارك فرضا لك ياالله فتقبل منى انك انت السميع العليم")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("\n(নাওয়াইতু আন আছুমা গাদাম মিন শাহরি রমাজানাল মুবারাকি ফারদাল্লাকা, ইয়া আল্লাহু ফাতাকাব্বাল মিন্নি ইন্নিকা আনতাস সামিউল আলিম।)\n\nঅর্থ: হে আল্লাহ! আগামীকাল পবিত্র রমযান মাসে তোমার পক্ষ হতে ফরয করা রোজা রাখার নিয়ত করলাম, অতএব তুমি আমার পক্ষ হতে কবুল কর, নিশ্চয়ই তুমি সর্বশ্রোতা ও সর্বজ্ঞানী।")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                        
                        VStack{
                            Text("ইফতারের দোয়া")
                                .font(.title3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("اللهم لك صمت و على رزقك افطرت")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("\n(আল্লাহুম্মা লাকা ছুমতু ওয়া আলা রিযক্বিকা ওয়া আফতারতু বিরাহমাতিকা ইয়া আরহামার রাহিমীন।)\n\nঅর্থ: হে আল্লাহ! আমি তোমারই সন্তুষ্টির জন্য রোজা রেখেছি এবং তোমারই দেয়া রিযিক্ব দ্বারা ইফতার করছি।")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                        
                        VStack{
                            Text("তারাবির নামাজের নিয়ত")
                                .font(.title3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("نويت ان اصلى لله تعالى ركعتى صلوة التراويح سنة رسول الله تعالى متوجها الى جهة الكعبة الشريفة الله اكبر")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("\n(নাওয়াইতু আন উসাল্লিয়া লিল্লাহি তায়ালা, রাকাআতাই সালাতিত তারাবিহ সুন্নাতু রাসূলিল্লাহি তায়ালা, মুতাওয়াজ্জিহান ইলা জিহাতিল কাবাতিশ শারিফাতি, আল্লাহু আকবার।)\n\nঅর্থ : আমি কেবলামুখি হয়ে দু’রাকাত তারাবির সুন্নতে মুয়াক্কাদা নামাজের নিয়ত করছি; আল্লাহু আকবার।")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                        
                        VStack{
                            Text("তারাবির নামাজের দোয়া")
                                .font(.title3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("৪ রাকাআত তারাবিহ আদায় করার পর ব্যাপক প্রচলিত একটি দোয়া রয়েছে। যা দেশের প্রায় মসজিদে পড়া হয়। আর তাহলো-\n")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                            Text("سُبْحانَ ذِي الْمُلْكِ وَالْمَلَكُوتِ سُبْحانَ ذِي الْعِزَّةِ وَالْعَظْمَةِ وَالْهَيْبَةِ وَالْقُدْرَةِ وَالْكِبْرِيَاءِ وَالْجَبَرُوْتِ سُبْحَانَ الْمَلِكِ الْحَيِّ الَّذِيْ لَا يَنَامُ وَلَا يَمُوْتُ اَبَدًا اَبَدَ سُبُّوْحٌ قُدُّوْسٌ رَبُّنا وَرَبُّ المْلائِكَةِ وَالرُّوْحِ")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("\nউচ্চারণ : ‘সুবহানা জিল মুলকি ওয়াল মালাকুতি, সুবহানা জিল ইয্যাতি ওয়াল আঝমাতি ওয়াল হায়বাতি ওয়াল কুদরাতি ওয়াল কিব্রিয়ায়ি ওয়াল ঝাবারুতি। সুবহানাল মালিকিল হাইয়্যিল্লাজি লা ইয়ানামু ওয়া লা ইয়ামুত আবাদান আবাদ; সুব্বুহুন কুদ্দুসুন রাব্বুনা ওয়া রাব্বুল মালায়িকাতি ওয়ার রূহ।")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                        
                        VStack{
                            Text("তারাবিহ নামাজের মুনাজাত")
                                .font(.title3)
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                                .frame(maxWidth: .infinity, alignment: .leading)
                            Text("اَللَهُمَّ اِنَّا نَسْئَالُكَ الْجَنَّةَ وَ نَعُوْذُبِكَ مِنَ النَّارِ يَا خَالِقَ الْجَنَّةَ وَالنَّارِ- بِرَحْمَتِكَ يَاعَزِيْزُ يَا غَفَّارُ يَا كَرِيْمُ يَا سَتَّارُ يَا رَحِيْمُ يَاجَبَّارُ يَاخَالِقُ يَابَارُّ - اَللَّهُمَّ اَجِرْنَا مِنَ النَّارِ يَا مُجِيْرُ يَا مُجِيْرُ يَا مُجِيْرُ- بِرَحْمَتِكَ يَا اَرْحَمَ الرَّحِمِيْنَ")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .trailing)
                            Text("\nউচ্চারণ : আল্লাহুম্মা ইন্না নাসআলুকাল জান্নাতা ওয়া নাউজুবিকা মিনাননার। ইয়া খালিক্বাল জান্নাতি ওয়ান নার। বিরাহমাতিকা ইয়া আঝিঝু ইয়া গাফফার, ইয়া কারিমু ইয়া সাত্তার, ইয়া রাহিমু ইয়া ঝাব্বার, ইয়া খালিকু ইয়া বার্রু। আল্লাহুম্মা আঝিরনা মিনান নার। ইয়া মুঝিরু, ইয়া মুঝিরু, ইয়া মুঝির। বিরাহমাতিকা ইয়া আরহামার রাহিমিন।")
                                .font(.custom("", size: 14))
                                .foregroundColor(.white)
                                .multilineTextAlignment(.leading)
                        }
                        .frame(width: 320, alignment: .leading)
                        .padding()
                        .background(Color(UIColor.midnightblue))
                        .border(Color.teal, width: 1)
                        .shadow(color: .teal, radius: 2)
                    }
                }
                Spacer()
                HStack{
                    Button("সূম্পর্ণ সূচি"){
                        self.mode.wrappedValue.dismiss()
                        contentProtocol.fullSchedulePressed = true
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
                        self.mode.wrappedValue.dismiss()
                        contentProtocol.selectDistrictPressed = true
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
            
        }
        .navigationBarHidden(true)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        

    }
}

struct DohaScreen_Previews: PreviewProvider {
    static var previews: some View {
        DohaScreen()
    }
}
