//
//  TrackDetailsModelData.swift
//  Last.fm Search App
//
//  Created by Alicia Windsor on 22/05/2021.
//

//http://ws.audioscrobbler.com/2.0/?method=track.getInfo&api_key=d527fc1829aecc7e54b63367b3d4621a&artist=cher&track=believe&format=json

import Foundation
import SwiftUI

class TrackDetailModelData {
    
    private let someView : TrackView
    
    init(someView: TrackView){
        self.someView = someView
    }
    
    private var infoDataTask: URLSessionDataTask?
    
    public func loadTrackInfo(searchTerm: String, completion: @escaping((TrackInfo) -> Void)){
        
        infoDataTask?.cancel()
        
        let url = buildUrl(forTerm: searchTerm)
        
        
        infoDataTask = URLSession.shared.dataTask(with: url!){ data, _, _ in
            if let data = data{
            
                do{
                    let songResponse = try JSONDecoder().decode(SongInfoResponse.self, from: data)
                       completion(songResponse.info)
                    
                }catch{print(error)}
                return
            }
        }
        infoDataTask?.resume()
    }
    
    public func loadInfo(){
        
    }
    
   private func buildUrl(forTerm searchTerm: String) -> URL?{
        guard !searchTerm.isEmpty else {return nil}
    
        let queryItems = [
            URLQueryItem(name: "method", value: "track.getInfo"),
            URLQueryItem(name: "track", value: searchTerm),
            URLQueryItem(name: "artist", value: someView.track.artist), //use search term and track artist toget detailed information from the specific json as it takes two parameters
            URLQueryItem(name: "api_key", value: "d527fc1829aecc7e54b63367b3d4621a"),
            URLQueryItem(name: "format", value: "json")
        ]
        
        var components = URLComponents(string: "https://ws.audioscrobbler.com/2.0/")
        components?.queryItems = queryItems

        return components?.url
    }
}

//Details
struct SongInfoResponse: Codable{
    let info: TrackInfo
}

struct TrackInfo: Codable {
    let album: AlbumData
    let summary: WikiData
}

struct AlbumData: Codable {
    let albumName: String
    
    enum CodingKeys: String, CodingKey {
        case albumName = "title"
    }
}

struct WikiData: Codable {
    let releaseDate: String
    let detailSummary: String
    
    enum CodingKeys: String, CodingKey {
        case releaseDate = "published"
        case detailSummary = "summary"
    }
}



