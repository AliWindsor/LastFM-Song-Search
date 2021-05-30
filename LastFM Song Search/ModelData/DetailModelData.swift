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

    private var infoDataTask: URLSessionDataTask?
    
    public func loadTrackInfo(title: String, artist: String, completion: @escaping((TrackInfo) -> Void)){
        
        infoDataTask?.cancel()
        
        guard let url = buildUrl(title: title, artist: artist)else{
            return
        }
        
        infoDataTask = URLSession.shared.dataTask(with: url){ data, _, _ in
            if let data = data{
            
                do{
                    let songResponse = try JSONDecoder().decode(SongInfoResponse.self, from: data)
                       completion(songResponse.track)
                        print(songResponse.track.album)
                    
                }catch{print(error)}
                return
            }
        }
        infoDataTask?.resume()
    }
    
    private func buildUrl(title songTitle: String, artist songArtist: String) -> URL?{
        guard !songTitle.isEmpty || !songArtist.isEmpty else {
            return nil
        }
    
        let queryItems = [
            URLQueryItem(name: "method", value: "track.getInfo"),
            URLQueryItem(name: "track", value: "hello"), //songTitle),
            URLQueryItem(name: "artist", value: "adele"), // songArtist),
            URLQueryItem(name: "api_key", value: "d527fc1829aecc7e54b63367b3d4621a"),
            URLQueryItem(name: "format", value: "json")
        ]
        
        var components = URLComponents(string: "https://ws.audioscrobbler.com/2.0/")
        components?.queryItems = queryItems

        return components?.url
    }
}

//Song Details
struct SongInfoResponse: Codable{
    let track: TrackInfo
    
    enum CodingKeys: String, CodingKey {
        case track
    }
}

struct TrackInfo: Codable {
    let album: AlbumData
    let summary: WikiData
    
    enum CodingKeys: String, CodingKey {
        case album = "album"
        case summary = "wiki"
    }
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



