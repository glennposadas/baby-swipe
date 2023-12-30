//
//  Keys.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 12/30/23.
//

import Foundation

struct AppKeys : Decodable {
  private let REV_CAT_API_KEY : String
  private let REV_CAT_APP_ID : String
  
  static var revCatAPIKey: String {
    let url = Bundle.main.url(forResource: "Keys", withExtension: "plist")!
    let data = try! Data(contentsOf: url)
    let appKeys = try! PropertyListDecoder().decode(AppKeys.self, from: data)
    return ""
  }
}
