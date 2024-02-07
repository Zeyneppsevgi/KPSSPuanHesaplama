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
    
    @State private var gyDogruSayisi: Double = 30
    @State private var gyYanlisSayisi: Double = 0
    
    @State private var ebDogruSayisi: Double = 40
    @State private var ebYanlisSayisi: Double = 0
    
    @State private var sonuc2022: Double = 0
    @State private var sonucEB2022: Double = 0
    @State private var sonuc2023: Double = 0
    @State private var sonucEB2023: Double = 0
    
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
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80) {
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
                } footer: {
                    if(ebDogruSayisi + ebYanlisSayisi > 80) {
                        Text("Toplam doğru ve yanlış sayıları 80 'i geçemez.")
                            .foregroundStyle(.red)
                    }
                }
                Section {
                    VStack(alignment: .leading) {
                        Text(" 2023 P3(Memur): \(sonuc2023, specifier: "%.3f")")
                            .bold()
                        Text(" 2023 P310(Öğretmen): \(sonucEB2023, specifier: "%.3f")")
                            .bold()

                    }
                    VStack(alignment: .leading) {
                        Text(" 2022 P3(Memur): \(sonuc2022, specifier: "%.3f")")
                            .bold()
                        Text(" 2022 P310(Öğretmen): \(sonucEB2022, specifier: "%.3f")")
                            .bold()

                    }
                   
                    

                    
                    
                    HesaplaButton(title: "Hesapla") {
                        let gkNet = gkDogruSayisi - (gkYanlisSayisi / 4)
                        let gyNet = gyDogruSayisi - (gyYanlisSayisi / 4)
                        let ebNet = ebDogruSayisi - (ebYanlisSayisi / 4)
                        withAnimation { //animasyon değeri sonuç hesaplandıktan sonra başka bir yerde kullanıyorsak animasyonla olacak
                            sonucEB2022 = 36.812 + gyNet * 0.3985 + gkNet * 0.3512 + ebNet * 0.34714
                            sonuc2022 = 48.616 + gyNet * 0.4756 + gkNet * 0.4192
                            
                            sonucEB2023 = 40.405 + gyNet * 0.3493 + gkNet * 0.3672 + ebNet * 0.37145
                            sonuc2023 = 51.209 + gyNet * 0.537 + gkNet * 0.418
                        }
                        
                    }
                    .disabled(formKontrol)
                    .sensoryFeedback(.success, trigger: sonuc2022)
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
        if((gyDogruSayisi + gyYanlisSayisi) > 60 || (gkDogruSayisi + gkYanlisSayisi)>60 || (ebDogruSayisi + ebYanlisSayisi) > 80) {
            return true
        }
        return false
    }
}

#Preview {
    EgitimBilimleriView()
}
