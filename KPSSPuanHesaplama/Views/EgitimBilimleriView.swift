//
//  EgitimBilimleriView.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 2.02.2024.
//

import SwiftUI

struct EgitimBilimleriView: View {
    @State private var gkDogruSayisi : Double = 30
    @State private var gkYanlisSayisi: Double = 0
    
    @State private var gyDogruSayisi: Double = 40
    @State private var gyYanlisSayisi: Double = 10
    
    @State private var sonuc: Double = 0
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
                }
                Section {
                    Text("KPSS Puanı: \(sonuc, specifier: "%.3f")")
                        .bold()
                    
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        withAnimation { //animasyon değeri sonuç hesaplandıktan sonra başka bir yerde kullanıyorsak animasyonla olacak
                            sonuc = 55.839 + gyNet * 0.348 + gkNet * 0.431
                        }
                        
                    }
                    .disabled(formKontrol)
                } header: {
                    Text("Sonuç")
                        .textCase(.none)
                }footer: {
                    if(gyDogruSayisi + gyYanlisSayisi > 60) {
                        Text("Toplam doğru ve yanlış sayıları 60 'ı geçemez.")
                            .foregroundStyle(.red)
                    }
                    
                }
            }
        }
        .navigationTitle("Eğitim Bilimleri")
    }
    var formKontrol: Bool { //doğrulama kontrolu
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi)>60) {
            return true
        }
        return false
    }
}

#Preview {
    EgitimBilimleriView()
}
