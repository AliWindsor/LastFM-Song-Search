//
//  WebView.swift
//  LastFM Song Search
//
//  Created by Alicia Windsor on 30/05/2021.
//

//loads a webpage of url in the application
import SwiftUI
import UIKit
import WebKit

struct WebView: UIViewRepresentable {
    
    var url: String
    
    func makeUIView(context: Context) -> WKWebView {
        
        guard let url = URL(string: self.url) else{
            return WKWebView()
        }
        
        let request = URLRequest(url: url)
        let wkWebview = WKWebView()
        wkWebview.load(request)
        return wkWebview
    }
    
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebView>) {
    }
}

