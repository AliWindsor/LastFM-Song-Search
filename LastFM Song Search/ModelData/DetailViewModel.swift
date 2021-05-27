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

class TrackDetailViewModel: Identifiable, ObservableObject{

    let album: String
    let released: String
    let summary: String
    
    init(dtl: TrackInfo){
        album = dtl.album.albumName
        released = dtl.summary.releaseDate
        summary = dtl.summary.detailSummary
    }
    
}
