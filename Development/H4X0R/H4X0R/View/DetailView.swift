// DetailView.swift

import SwiftUI
import Foundation
import WebKit

struct DetailView: View {
    let url: String? // Declare the url as a property
    
    var body: some View {
       WebView(urlString: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://google.com") // Pass the URL as a parameter in the preview
    }
}


