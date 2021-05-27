//
//  ContentView.swift
//  LastFM Song Search
//
//  Created by Alicia Windsor on 22/05/2021.
//

import SwiftUI
import UIKit

struct ContentView: View {
    
    @ObservedObject var viewModel: TrackListViewModel
    
    init() {
        viewModel = TrackListViewModel()
        
        UITableView.appearance()
            .backgroundColor = .clear
       }

    var body: some View {
        
        NavigationView{
            ZStack{
                Color.gray.opacity(0.3)
                    .ignoresSafeArea()
                
                VStack{
                    Image("last-fm-icon")
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Spacer()
                        .frame(height:30)
            
                    SearchBar(searchTerm: $viewModel.searchTerm)
                    
                    if(viewModel.tracks.isEmpty){
                       
                    }else{
                        List(viewModel.tracks){ track in
                            
                           NavigationLink(destination: EmptyView()){
                            TrackView(track: track)
                        }
                            
                           /* Link(destination: URL(string: (String(track.url)))!){
                                
                                TrackView(track: track)
                            }*/
                            
                        }
                    
                    }
  
                }
                
            }
            .navigationTitle("")
            .navigationBarHidden(true)
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
