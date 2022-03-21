//
//  DistrictDOM.swift
//  Ramadan
//
//  Created by Md Arifur Rahaman on 17/3/22.
//

import Foundation

class DistrictList{
    
    let distBn: [String] = ["ঢাকা","গাজীপুর","কিশোরগঞ্জ","মানিকগঞ্জ","মুন্সীগঞ্জ","নারায়ণগঞ্জ","নরসিংদী","টাঙ্গাইল","ফরিদপুর","গোপালগঞ্জ","মাদারীপুর","রাজবাড়ী","শরীয়তপুর",
                            "চট্টগ্রাম","ব্রাহ্মণবাড়িয়া","কুমিল্লা","চাঁদপুর","লক্ষ্মীপুর","নোয়াখালী","ফেনী","খাগড়াছড়ি","রাঙামাটি","বান্দরবান","কক্সবাজার","খুলনা","চুয়াডাঙ্গা","যশোর",
                            "ঝিনাইদাহ","বাগেরহাট","কুষ্টিয়া","মাগুরা","মেহেরপুর","নড়াইল","সাতক্ষীরা","রাজশাহী","বগুড়া","জয়পুরহাট","নওগাঁ","নাটোরে","পাবনা","চাঁপাইনবাবগঞ্জ","সিরাজগঞ্জ","রংপুর","দিনাজপুর","কুড়িগ্রাম","নীলফামারী","গাইবান্ধা","ঠাকুরগাঁও","পঞ্চগড়","লালমনিরহাট","বরিশাল","বরগুনা","ভোলা","ঝালকাঠী",
                                "পটুয়াখালী","পিরোজপুর","সিলেট","সুনামগঞ্জ","হবিগঞ্জ","মৌলভীবাজার","ময়মনসিংহ","নেত্রকোনা","জামালপুর","শেরপুর"]
    let distEn: [String] = ["Dhaka","Gazipur","Kishoreganj","Manikganj","Munshiganj","Narayanganj","Narsingdi","Tangail","Faridpur","Gopalganj","Madaripur","Rajbari","Shariatpur","Chattogram","Brahmanbaria","Cumilla","Chandpur","Lakshmipur","Noakhali","Feni","Khagrachhari","Rangamati", "Bandarban","Cox's Bazaar","Khulna","Chuadanga","Jessore","Jhenaidah","Bagerhat", "Kushtia","Magura","Meherpur","Narail","Satkhira","Rajshahi","Bogura","Joypurhat","Naogaon","Natore","Pabna","Chapainawabganj","Sirajgonj","Rangpur","Dinajpur","Kurigram","Nilphamari","Gaibandha","Thakurgaon","Panchagarh","Lalmonirhat","Barisal","Barguna","Bhola","Jhalokati","Patuakhali","Pirojpur","Sylhet","Shunamganj","Habiganj","Moulovibazar","Mymensingh","Netrokona","Jamalpur","Sherpur"]
    let distCode: [Int] = [22001,22002,22003,22004,22005,22006,22007,22008,22009,22010,22011,22012,22013,22014,22015,22016,22017,22018,22019,22020,
                    22021,22022,22023,22024,22025,22026,22027,22028,22029,22030,22031,22032,22033,22034,22035,22036,22037,22038,22039,
                    22040,22041,22042,22043,22044,22045,22046,22047,22048,22049,22050,22051,22052,22053,22054,22055,22056,22057,22058,
                    22059,22060,22061,22062,22063,22064]
    
    
    
    let districtListBn = ["ঢাকা","গাজীপুর","কিশোরগঞ্জ","মানিকগঞ্জ","মুন্সীগঞ্জ","নারায়ণগঞ্জ","নরসিংদী","টাঙ্গাইল","ফরিদপুর","গোপালগঞ্জ","মাদারীপুর","রাজবাড়ী","শরীয়তপুর",
                          "চট্টগ্রাম","ব্রাহ্মণবাড়িয়া","কুমিল্লা","চাঁদপুর","লক্ষ্মীপুর","নোয়াখালী","ফেনী","খাগড়াছড়ি","রাঙামাটি","বান্দরবান","কক্সবাজার","খুলনা","চুয়াডাঙ্গা","যশোর",
                          "ঝিনাইদাহ","বাগেরহাট","কুষ্টিয়া","মাগুরা","মেহেরপুর","নড়াইল","সাতক্ষীরা","রাজশাহী","বগুড়া","জয়পুরহাট","নওগাঁ","নাটোরে","পাবনা","চাঁপাইনবাবগঞ্জ","সিরাজগঞ্জ","রংপুর","দিনাজপুর","কুড়িগ্রাম","নীলফামারী","গাইবান্ধা","ঠাকুরগাঁও","পঞ্চগড়","লালমনিরহাট","বরিশাল","বরগুনা","ভোলা","ঝালকাঠী",
                              "পটুয়াখালী","পিরোজপুর","সিলেট","সুনামগঞ্জ","হবিগঞ্জ","মৌলভীবাজার","ময়মনসিংহ","নেত্রকোনা","জামালপুর","শেরপুর"]
    
    let districtListEng = ["Dhaka","Gazipur","Kishoreganj","Manikganj","Munshiganj","Narayanganj","Narsingdi","Tangail","Faridpur","Gopalganj","Madaripur","Rajbari","Shariatpur","Chattogram","Brahmanbaria","Cumilla","Chandpur","Lakshmipur","Noakhali","Feni","Khagrachhari","Rangamati", "Bandarban","Cox's Bazaar","Khulna","Chuadanga","Jessore","Jhenaidah","Bagerhat", "Kushtia","Magura","Meherpur","Narail","Satkhira","Rajshahi","Bogura","Joypurhat","Naogaon","Natore","Pabna","Chapainawabganj","Sirajgonj","Rangpur","Dinajpur","Kurigram","Nilphamari","Gaibandha","Thakurgaon","Panchagarh","Lalmonirhat","Barisal","Barguna","Bhola","Jhalokati","Patuakhali","Pirojpur","Sylhet","Shunamganj","Habiganj","Moulovibazar","Mymensingh","Netrokona","Jamalpur","Sherpur"]
    
    let districtCode = [22001,22002,22003,22004,22005,22006,22007,22008,22009,22010,22011,22012,22013,22014,22015,22016,22017,22018,22019,22020,
                        22021,22022,22023,22024,22025,22026,22027,22028,22029,22030,22031,22032,22033,22034,22035,22036,22037,22038,22039,
                        22040,22041,22042,22043,22044,22045,22046,22047,22048,22049,22050,22051,22052,22053,22054,22055,22056,22057,22058,
                        22059,22060,22061,22062,22063,22064]
}

struct DistricObj{
    let distNameEn, distNameBn: String
    let distCOde: Int
    
    
}
