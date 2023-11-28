//
//  WebView.swift
//  H4X0R
//
//  Created by Aniket Singh on 28/11/23.
//

import SwiftUI
import Foundation
import WebKit


struct WebView: UIViewRepresentable{
    
    let urlString: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let safeString = urlString{
            if let url = URL(string: safeString){
                let request=URLRequest(url: url)
                uiView.load(request)
            }
        }
    }
}
