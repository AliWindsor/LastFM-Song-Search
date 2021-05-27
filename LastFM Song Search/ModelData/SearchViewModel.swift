//
//  TrackListViewModel.swift
//  Last.fm Search App
//
//  Created by Alicia Windsor on 22/05/2021.
//

import SwiftUI
import Foundation
import Combine

class TrackListViewModel: ObservableObject {
    @Published var searchTerm: String = ""
    @Published public var tracks: [TrackSearchViewModel] = []
    @Published public var details: [TrackDetailViewModel] = []
    
    private let dataModel: TrackSearchModelData = TrackSearchModelData()
    private let detailDataModel: TrackDetailModelData = TrackDetailModelData()
    private let imageLoader: TrackImageLoader = TrackImageLoader()
    private var disposables = Set<AnyCancellable>()
    
    init(){
        $searchTerm
            .sink(receiveValue: loadAllTracks(searchTerm: ))
            .store(in: &disposables)
    }

    private func loadAllTracks(searchTerm: String){
        tracks.removeAll()
        imageLoader.reset()
        
        dataModel.loadTracks(searchTerm: searchTerm) { tracks in
            tracks.forEach{ self.appendTrack(track: $0) }
        }
        
        detailDataModel.loadTrackInfo(searchTerm: searchTerm){ tracks in
            let detailVM = TrackDetailViewModel(dtl: tracks)
            
            DispatchQueue.main.async {
                self.details.append(detailVM)
            }
            
        }
    }
    
    private func appendTrack(track: Tracks){
        let trackViewModel = TrackSearchViewModel(trk: track)
        
        DispatchQueue.main.async{
            self.tracks.append(trackViewModel)
        }
        
        imageLoader.loadArtwork(forTrack: track){ image in
            DispatchQueue.main.async {
              trackViewModel.image = image
        }
            
        }
    }
    
    //private func append
    
}

class TrackSearchViewModel: Identifiable, ObservableObject{
    let title: String
    var artist: String
    let url: String
    @Published var image: Image?
    
    init(trk: Tracks){
        title = trk.songName
        artist = trk.singerName
        url = trk.trackUrl
    }
}

