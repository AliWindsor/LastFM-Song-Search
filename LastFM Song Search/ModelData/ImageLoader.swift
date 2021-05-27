//
//  TrackImageLoader.swift
//  LastFM Song Search
//
//  Created by Alicia Windsor on 24/05/2021.
//

import Foundation
import SwiftUI

class TrackImageLoader {
  private var dataTasks: [URLSessionDataTask] = []
  
    func loadArtwork(forTrack track: Tracks, completion: @escaping((Image?) -> Void)) {

        guard let imageUrl = URL(string: track.albumImage[1].url) else {
      completion(nil)
      return
    }
    
    let dataTask = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
      guard let data = data, let artwork = UIImage(data: data) else {
        completion(nil)
        return
      }
      
      let image = Image(uiImage: artwork)
      completion(image)
    }
    dataTasks.append(dataTask)
    dataTask.resume()
  }

  func reset() {
    dataTasks.forEach { $0.cancel() }
    dataTasks.removeAll()
  }
}

