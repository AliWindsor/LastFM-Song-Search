//
//  TrackImageView.swift
//  LastFM Song Search
//
//  Created by Alicia Windsor on 26/05/2021.
//

import SwiftUI

struct TrackImageView: View {
  let image: Image?
  
  var body: some View {
    ZStack {
      if image != nil {
        image
      } else {
        
        Color(.red)
        
        Image(systemName: "music.note")
          .font(.largeTitle)
          .foregroundColor(.white)
      }
    }
    .frame(width: 50, height: 50)
    .shadow(radius: 5)
    .padding(.trailing, 5)
  }
}
