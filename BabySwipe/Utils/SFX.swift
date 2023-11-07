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
  case gaming
  
  var filename: String {
    switch self {
    case .bgMusic:
      return "happy-childhood-loop-173335.mp3"
    case .gaming:
      return Int.random(in: 1...2) == 1 ? "alexander-nakarada-silly-intro(chosic.com).mp3"
      : "funny-accompanying-background-music-for-video-vlogs-one-day-baby-154587.mp3"
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
    stopCurrentMusic()
    
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
