//
//  OABTView.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 2.02.2024.
//

import SwiftUI

struct OABTView: View {
    @State private var gkDogruSayisi : Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var gyDogruSayisi: Double = 30
    @State private var gyYanlisSayisi: Double = 0
    
    @State private var ebDogruSayisi: Double = 40
    @State private var ebYanlisSayisi: Double = 0
    
    @State private var oabtDogruSayisi: Double = 40
    @State private var oabtYanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonucEB2022: Double = 0
    @State private var sonucOABT2022: Double = 0
    @State private var sonuc2023: Double = 0
    @State private var sonucEB2023: Double = 0
    @State private var sonucOABT2023: Double = 0
    
    @State private var oabtKatsayi = 0.4334
    @State private var oabtPuan = 43.805
    
    @State private var selectedOption = 0
    let options = [
        (0.4334,43.805, "Beden Eğitimi"),
        (0.3666,41.071, "Biyoloji"),
        (0.4301,39.060, "Coğrafya"),
        (0.4052,34.908, "Din Kültürü"),
        (0.3679,42.156, "Edebiyat"),
        (0.5388,39.313, "Fen Bilgisi"),
        (0.3817,41.604, "Fizik"),
        (0.5225,36.309, "İlköğretim Matematik"),
        (0.3883,37.962, "İmam Hatip Meslek Dersleri Ö."),
        (0.3791,40.920, "İngilizce"),
        (0.4542,42.157, "Kimya"),
        (0.4247,41.759, "Lise Matematik"),
        (0.4944,33.292, "Okul Öncesi"),
        (0.4883,29.014, "Sınıf Öğretmenliği"),
        (0.6142,34.101, "Sosyal Bilgiler"),
        (0.3521,41.418, "Tarih"),
        (0.4565,34.329, "Türkçe")
    ]
  
    @State private var isShowingSheet = false
    
    var body: some View {
        VStack {
            Form { //ekrandaki bileşen nesneleri tutmak için form lazım
                Section {
                    Stepper("Doğru Sayısı: \(gkDogruSayisi, specifier: "%.0f")", value: $gkDogruSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(gkYanlisSayisi,specifier: "%.0f")", value: $gkYanlisSayisi, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                        .bold()
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                        .foregroundColor(.main)
                } footer: {
                    if(gkDogruSayisi + gkYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60 'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                    
                }
                Section {
                    Stepper("Doğru Sayısı: \(gyDogruSayisi,specifier: "%.0f")", value: $gyDogruSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(gyYanlisSayisi,specifier: "%.0f")", value: $gyYanlisSayisi, in: 0...60)
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                        .bold()
                } header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                        .foregroundColor(.main)
                } footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 80) {
                        Text("Toplam doğru ve yanlış sayıları 60 'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Stepper("Doğru Sayısı: \(ebDogruSayisi,specifier: "%.0f")", value: $ebDogruSayisi, in: 1...80)
                        .sensoryFeedback(.selection, trigger: ebDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(ebYanlisSayisi,specifier: "%.0f")", value: $ebYanlisSayisi, in: 0...80)
                        .sensoryFeedback(.selection, trigger: ebYanlisSayisi)
                        .bold()
                } header: {
                    Text("Eğitim Bilimleri")
                        .textCase(.none)
                        .foregroundColor(.main)
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80) {
                        Text("Toplam doğru ve yanlış sayıları 80 'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                
                Section {
                    Picker("Bölüm Seçiniz", selection:$selectedOption) {
                        ForEach(0..<options.count, id: \.self) { index in
                            HStack {
                                Image(systemName:  "person.circle.fill")
                                Text(options[index].2)
                            }
                            
                        }
                    }
                    .onChange(of: selectedOption) {
                        oabtKatsayi = options[selectedOption].0
                        oabtPuan = options[selectedOption].1
                    }
                    Stepper("Doğru Sayısı: \(oabtDogruSayisi,specifier: "%.0f")", value: $oabtDogruSayisi, in: 1...75)
                        .sensoryFeedback(.selection, trigger: oabtDogruSayisi)
                        .bold()
                    Stepper("Yanlış Sayısı: \(oabtYanlisSayisi,specifier: "%.0f")", value: $oabtYanlisSayisi, in: 0...75)
                        .sensoryFeedback(.selection, trigger: oabtYanlisSayisi)
                        .bold()
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        let oabtNet = oabtDogruSayisi - (oabtYanlisSayisi / 4)
                      
                            sonucEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonuc2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                        sonucOABT2022 = oabtPuan + gyNet * 0.3493 + gkNet * 0.1515 + ebNet * 0.37145 + oabtNet * oabtKatsayi
                            sonucEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        isShowingSheet.toggle()
                     
                        
                    }
                    .disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                    .sheet(isPresented: $isShowingSheet) {
                        SonucView(sonuc2022: sonuc2022, sonucEB2022: sonucEB2022, sonucOABT2022: sonucOABT2022, sonuc2023: sonuc2023, sonucEB2023: sonucEB2023, sonucOABT2023: nil)
                    }
                } header: {
                    Text("ÖABT")
                        .bold()
                        .textCase(.none)
                        .foregroundStyle(.main)
                } footer: {
                    if(oabtDogruSayisi + oabtYanlisSayisi > 75) {
                        Text("Toplam doğru ve yanlış sayıları 75 'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
            }
        }
        .navigationTitle("ÖABT")
    }
    var formKontrol: Bool { //doğrulama kontrolu
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi)>60 || (ebDogruSayisi + ebYanlisSayisi) > 80 || (oabtDogruSayisi + oabtYanlisSayisi) > 75) {
            return true
        }
        return false
    }
}

#Preview {
    OABTView()
}
