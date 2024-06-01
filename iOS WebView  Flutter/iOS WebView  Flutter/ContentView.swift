//
//  ContentView.swift
//  iOS WebView Flutter
//
//  Created by Giovanni on 28/05/24.
//

import SwiftUI
import WebKit

struct ContentView: View {
    @StateObject private var webViewModel = WebViewModel()
    @State private var urlString = "https://previous-quince.surge.sh/"
    
    var body: some View {
        VStack {
            HStack {
                Button(action: {
                    webViewModel.goBack()
                }) {
                    Image(systemName: "arrow.backward")
                        .font(.title)
                        .padding()
                }
                
                TextField("Enter URL", text: $urlString)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(.horizontal)
                
                Button(action: {
                    webViewModel.loadURL(urlString: urlString)
                }) {
                    Text("Go")
                        .padding()
                }
                
                Button(action: {
                    webViewModel.goForward()
                }) {
                    Image(systemName: "arrow.forward")
                        .font(.title)
                        .padding()
                }
            }
            .background(Color(.systemGray6))
            
            // Main WebView
            WebView(webViewModel: webViewModel)
                .edgesIgnoringSafeArea(.all)
        }
        .onAppear {
            webViewModel.loadURL(urlString: urlString)
        }
    }
}

struct WebView: UIViewRepresentable {
    @ObservedObject var webViewModel: WebViewModel
    
    func makeUIView(context: Context) -> WKWebView {
        webViewModel.webView.navigationDelegate = context.coordinator
        webViewModel.webView.allowsBackForwardNavigationGestures = true
        return webViewModel.webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, WKNavigationDelegate {
        var parent: WebView
        
        init(_ parent: WebView) {
            self.parent = parent
        }
        
        func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            print("Failed to load: \(error.localizedDescription)")
        }
        
        func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
            print("Finished loading")
        }
    }
}

class WebViewModel: ObservableObject {
    let webView: WKWebView
    
    init() {
        let configuration = WKWebViewConfiguration()
        configuration.preferences.javaScriptEnabled = true
        
        self.webView = WKWebView(frame: .zero, configuration: configuration)
    }
    
    func loadURL(urlString: String) {
        if let url = URL(string: urlString) {
            webView.load(URLRequest(url: url))
        }
    }
    
    func goBack() {
        webView.goBack()
    }
    
    func goForward() {
        webView.goForward()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
