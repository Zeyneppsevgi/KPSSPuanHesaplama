//
//  ResultView.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 31.01.2024.
//

import SwiftUI

struct ResultView: View {
    var body: some View {
        NavigationStack {
            VStack {
                List(0..<50) { item in
                    
                    Text("Hesaplama \(item)")
                }
            }
            .navigationTitle("Geçmiş Hesaplamalar")
        }
    }
}

#Preview {
    ResultView()
}
