//
//  TrackSearchModelData.swift
//  Last.fm Search App
//
//  Created by Alicia Windsor on 22/05/2021.
//

import Foundation

//http://ws.audioscrobbler.com/2.0/?method=track.search&track=(SEARCHTERM)&api_key=d527fc1829aecc7e54b63367b3d4621a&format=json

class TrackSearchModelData {
    
    private var dataTask: URLSessionDataTask?
    
    public func loadTracks(searchTerm: String, completion: @escaping(([Tracks]) -> Void)){
        
        dataTask?.cancel()
        
        guard let url = buildUrl(forTerm: searchTerm) else {
            completion([])
            return
        }
        
        dataTask = URLSession.shared.dataTask(with: url){ data, _, _ in
            guard let data = data else{
                completion([])
                return
            }
            
            if let songResponse = try? JSONDecoder().decode(SongResponse.self, from: data){
                completion(songResponse.songs.trackMatches.matches)
            }
        }
        dataTask?.resume()
    }
    
    
    
    
   private func buildUrl(forTerm searchTerm: String) -> URL?{
        guard !searchTerm.isEmpty else {return nil}
        
        //var searchURL = "http://ws.audioscrobbler.com/2.0/?method=track.search&track=\(searchTerm)&api_key=d527fc1829aecc7e54b63367b3d4621a&format=json"
        
        let queryItems = [
            URLQueryItem(name: "method", value: "track.search"),
            URLQueryItem(name: "track", value: searchTerm),
            URLQueryItem(name: "api_key", value: "d527fc1829aecc7e54b63367b3d4621a"),
            URLQueryItem(name: "format", value: "json")
        ]
        
        var components = URLComponents(string: "https://ws.audioscrobbler.com/2.0/")
        components?.queryItems = queryItems
 
        //return URL(string: searchURL)
        return components?.url
    }
    
   // print(buildUrl(forTerm: "Hi"))

}


//Find Song

struct SongResponse: Decodable{
    let songs : TrackResults
    
    enum CodingKeys: String, CodingKey {
        case songs = "results"
    }
}

struct TrackResults: Decodable {
    var trackMatches: TrackMatches
   
    enum CodingKeys: String, CodingKey {
        case trackMatches = "trackmatches"
    }
}

struct TrackMatches: Decodable {
    let matches : [Tracks]
    
    enum CodingKeys: String, CodingKey {
        case matches = "track"
    }
}

struct Tracks: Decodable {
     let songName: String
     let singerName: String
     let trackUrl: String
     let albumImage: [TrackImage]
    
    enum CodingKeys: String, CodingKey {
        case songName = "name"
        case singerName = "artist"
        case trackUrl = "url"
        case albumImage = "image"
    }
    
    struct TrackImage: Decodable{
        let url: String
        let size: String
        
        enum CodingKeys: String, CodingKey{
            case url = "#text"
            case size
        }
    }
}


