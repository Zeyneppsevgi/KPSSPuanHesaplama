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
            Label(title, systemImage: "plus.forwardslash.minus")
                .font(.title)
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)

        })
        .buttonStyle(.borderedProminent)
        .tint(.main)
    }
}

#Preview {
    HesaplaButton(title: "Hesapla", action: {
        print("İlk SwiftUI Uygulamam")
    })
}
