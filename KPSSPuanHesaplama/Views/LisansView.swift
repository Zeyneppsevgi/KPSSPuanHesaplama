//
//  LisansView.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 2.02.2024.
//

import SwiftUI

struct LisansView: View {
    @State private var gkDogruSayisi : Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var gyDogruSayisi: Double = 40
    @State private var gyYanlisSayisi: Double = 10
    
    @State private var sonuc2022: Double = 0
    @State private var sonuc2023: Double = 0
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
                }
                Section {
                    Text(" 2022 KPSS Puanı: \(sonuc2022, specifier: "%.3f")")
                        .bold()
                    Text(" 2023 KPSS Puanı: \(sonuc2023, specifier: "%.3f")")
                        .bold()
                    
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        withAnimation { //animasyon değeri sonuç hesaplandıktan sonra başka bir yerde kullanıyorsak animasyonla olacak
                            sonuc2022 = (48.616 + gyNet * 0.537 + gkNet * 0.418)
                            sonuc2023 = (51.209 + gyNet * 0.4756 + gkNet * 0.4192)
                        }
                        
                    }
                    .disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
                } header: {
                    Text("Sonuç")
                        .textCase(.none)
                        .foregroundColor(.main)
                }footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60 'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                    
                }
            }
        }
        .navigationTitle("Lisans B Grubu")
    }
    var formKontrol: Bool { //doğrulama kontrolu
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi)>60) {
            return true
        }
        return false
    }
}

#Preview {
    LisansView()
}
