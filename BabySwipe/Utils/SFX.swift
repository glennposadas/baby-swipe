//
//  SFX.swift
//  WhereIsABC
//
//  Created by Glenn Posadas on 12/17/20.
//

import AVFoundation
import Foundation

enum SFXType {
  case bgMusic
  
  var filename: String {
    switch self {
    case .bgMusic:
      return "happy-childhood-loop-173335.mp3"
    }
  }
}

class SFX {
  
  // MARK: - Properties
  
  static let shared = SFX()
  private var player: AVAudioPlayer?
  
  // MARK: - Overrides
  // MARK: Functions
  
  private init() {
    
  }
  
  // MARK: - BG
  
  func playMusic(_ sfxType: SFXType) {
    let soundFilePath = "\(Bundle.main.resourcePath ?? "")/\(sfxType.filename)"
    let soundFileURL = URL(fileURLWithPath: soundFilePath)
    
    player = try? AVAudioPlayer(contentsOf: soundFileURL)
    player?.numberOfLoops = -1 //Infinite
    
    player?.play()
  }
  
  func stopCurrentMusic() {
    player?.stop()
  }
}
