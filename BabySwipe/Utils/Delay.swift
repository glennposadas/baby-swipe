//
//  Delay.swift
//  BabiesFirsts
//
//  Created by Glenn Posadas on 8/23/23.
//

import Foundation

class Delay: NSObject {
  @objc static func delay(_ seconds: Int, block: @escaping (()->())) {
    DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(seconds), execute: block)
  }
}

