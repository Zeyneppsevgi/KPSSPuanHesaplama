//
//  MainView.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 31.01.2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List{
                    Section {
                        NavigationLink(destination: OrtaogretimView()) { //segue gibi sayfalar arası iletişim
                            HStack {
                                Image(systemName: "1.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.main)
                                Text("Ortaöğretim")
                                    .badge(
                                        Text("p94")
                                            .italic()
                                            .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: OnlisansView()) {
                            HStack {
                                Image(systemName: "2.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.main)
                                Text("Önlisans")
                                    .badge(
                                        Text("p93")
                                            .italic()
                                            .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: LisansView()) {
                            HStack {
                                Image(systemName: "3.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.main)
                                Text("Lisans (B Grubu)")
                                    .badge(
                                        Text("p3")
                                            .italic()
                                            .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: EgitimBilimleriView()) {
                            HStack {
                                Image(systemName: "4.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.main)
                                Text("Eğitim Bilimleri")
                                    .badge(
                                        Text("p10")
                                            .italic()
                                            .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        NavigationLink(destination: OABTView()) {
                            HStack {
                                Image(systemName: "5.circle")
                                    .resizable()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.main)
                                Text("ÖABT")
                                    .badge(
                                        Text("p121")
                                            .italic()
                                            .foregroundStyle(.main)
                                    )
                                
                            }
                        }
                        
                        
                    } header: {
                        Text("Bölüm Seçiniz")
                            .textCase(.none) //ne yazdıysak onu gösterir önceki hali hepsi büyüktü
                    }
                }
            }
            .navigationTitle("KPSS Puan Hesaplama")
        }
    }
}

#Preview {
    MainView()
}
