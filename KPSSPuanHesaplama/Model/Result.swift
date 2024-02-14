//
//  Result.swift
//  KPSSPuanHesaplama
//
//  Created by Zeynep Sevgi on 14.02.2024.
//

import Foundation
import SwiftData
//swiftdata kullanmak için @model koyduk
@Model
class Result: Identifiable {
    
    @Attribute(.unique) let id = UUID()
    let sinavAdi: String
    let gyNet: Double
    let gkNet: Double
    let ebNet: Double?
    let oabtNet: Double?
    let tarih = Date()
    let sonuc: Double
    
    init(sinavAdi: String, gyNet: Double, gkNet: Double, ebNet: Double? = nil, oabtNet: Double? = nil, sonuc: Double) {
        self.sinavAdi = sinavAdi
        self.gyNet = gyNet
        self.gkNet = gkNet
        self.ebNet = ebNet
        self.oabtNet = oabtNet
        self.sonuc = sonuc
    }
}
