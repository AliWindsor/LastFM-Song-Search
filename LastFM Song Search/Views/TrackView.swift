//
//  TracksRows.swift
//  LastFM Song Search
//
//  Created by Alicia Windsor on 22/05/2021.
//

import SwiftUI

struct TrackView: View {

@ObservedObject var track: TrackSearchViewModel
    
  var body: some View {
    
    HStack(){
        
        TrackImageView(image: track.image)
          .padding(.trailing)
        
        VStack(alignment: .leading) {
        
            Text(track.title)
            Text(track.artist)
              .font(.subheadline)
              .foregroundColor(.gray)
      }
      .padding()
    }
  }
}
