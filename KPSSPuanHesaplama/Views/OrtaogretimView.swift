//
//  OrtaogretimView.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 2.02.2024.
//

import SwiftUI

struct OrtaogretimView: View {
    @State private var gkDogruSayisi = 30
    @State private var gkYanlisSayisi = 0
    
    @State private var gyDogruSayisi = 30
    @State private var gyYanlisSayisi = 0
    
    @State private var sonuc = 0
    var body: some View {
        VStack {
            Form { //ekrandaki bileşen nesneleri tutmak için form lazım
                Section {
                    Stepper("Doğru Sayısı: \(gkDogruSayisi)", value: $gkDogruSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkDogruSayisi)
                    Stepper("Yanlış Sayısı: \(gkYanlisSayisi)", value: $gkYanlisSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gkYanlisSayisi)
                } header: {
                    Text("Genel Kültür")
                        .textCase(.none)
                }
                Section {
                    Stepper("Doğru Sayısı: \(gyDogruSayisi)", value: $gyDogruSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyDogruSayisi)
                    Stepper("Yanlış Sayısı: \(gyYanlisSayisi)", value: $gyYanlisSayisi, in: 1...60)
                        .sensoryFeedback(.selection, trigger: gyYanlisSayisi)
                } header: {
                    Text("Genel Yetenek")
                        .textCase(.none)
                }
                Section {
                    Text("KPSS Puanı: \(sonuc)")
                    
                    HesaplaButton(title: "Hesapla") {
                        print("Hesaplama işlemleri")
                    }
                } header: {
                    Text("Sonuç")
                        .textCase(.none)
                }
            }
        }
        .navigationTitle("Ortaöğretim")
    }
}

#Preview {
    OrtaogretimView()
}
