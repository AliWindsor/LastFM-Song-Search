//
//  TrackDetail.swift
//  LastFM Song Search
//
//  Created by Alicia Windsor on 24/05/2021.
//

import SwiftUI

struct TrackDetail: View {
    //takes tracksearch and trackdetail
    
    @ObservedObject var track: TrackInfoViewModel
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack{
                Text(track.album)
                Text(track.released)
                Text(track.summary)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
    }
}

