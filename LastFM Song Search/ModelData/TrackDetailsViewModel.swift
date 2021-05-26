//
//  TrackDetailsViewModel.swift
//  Last.fm Search App
//
//  Created by Alicia Windsor on 22/05/2021.
//

import Foundation
import Combine

class TrackInfoListViewModel: ObservableObject{
    //Use loader here
    
}

class TrackInfoViewModel: Identifiable, ObservableObject{

    let album: String
    let released: String
    let summary: String
    
    init(response: SongInfoResponse){
        album = response.info.album.albumName
        released = response.info.summary.releaseDate
        summary = response.info.summary.detailSummary
    }
    
}
