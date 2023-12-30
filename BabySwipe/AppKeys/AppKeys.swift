//
//  Keys.swift
//  BabySwipe
//
//  Created by Glenn Posadas on 12/30/23.
//

import Foundation

struct AppKeys: Decodable {
  private let REV_CAT_API_KEY : String
  private let REV_CAT_APP_ID : String
  
  private static let properties: AppKeys = {
    guard let path = Bundle.main.path(forResource: "AppKeys", ofType: "plist"),
          let data = try? Data(contentsOf: URL(filePath: path)),
          let appKeys = try? PropertyListDecoder().decode(AppKeys.self, from: data) else {
      fatalError("Failed to load AppKeys from plist")
    }
    return appKeys
  }()
  
  // MARK: -
  // MARK: Public
  
  static let revCatAPIKey = properties.REV_CAT_API_KEY
  static let revCatAppId = properties.REV_CAT_APP_ID
}
