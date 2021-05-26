//
//  SearchBar.swift
//  Last.fm Search App
//
//  Created by Alicia Windsor on 21/05/2021.
//

import SwiftUI

struct SearchBar: UIViewRepresentable {
    
    typealias UIViewType = UISearchBar
    
    @Binding var searchTerm: String
   
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
            searchBar.delegate = context.coordinator
            searchBar.searchBarStyle = .minimal
            searchBar.placeholder = "Search"
            searchBar.searchTextField.backgroundColor = .white
            searchBar.searchTextField.layer.cornerRadius = 18
            searchBar.searchTextField.clipsToBounds = true

            return searchBar

    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(searchTerm: $searchTerm)
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate{
        @Binding var searchTerm: String
        
        init(searchTerm: Binding<String>){
            self._searchTerm = searchTerm
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            searchTerm = searchBar.text ?? ""
            UIApplication.shared.windows.first{$0.isKeyWindow}?.endEditing(true)
        }
    }
    
}
