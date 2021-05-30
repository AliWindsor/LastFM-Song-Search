//
//  TrackDetailsViewModel.swift
//  Last.fm Search App
//
//  Created by Alicia Windsor on 22/05/2021.
//

//MARK: INCOMPLETE

import Foundation
import Combine

class TrackDetailListViewModel: ObservableObject{
    var songTitle: String = " "
    var songArtist: String = " "
    
    //@Published public var details: [TrackDetailViewModel] = detailDataModel.loadTrackInfo(title: songTitle, artist: songArtist)
    
    private let detailDataModel: TrackDetailModelData = TrackDetailModelData()

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
