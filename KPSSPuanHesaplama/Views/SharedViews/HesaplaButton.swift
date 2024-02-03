//
//  HesaplaButton.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 3.02.2024.
//

import SwiftUI

struct HesaplaButton: View {
    
    let title: String
    let action: ()-> Void
    
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .bold()
                .font(.title2)
                .padding(10)
                .frame(maxWidth: .infinity)
        })
        .buttonStyle(.bordered)
        .tint(.main)
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("İlk SwiftUI Uygulamam")
    })
}
