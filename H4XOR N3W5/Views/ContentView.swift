//
//  ContentView.swift
//  H4XOR N3W5
//
//  Created by John Brennan on 3/4/21.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        NavigationView {
            List(networkManager.posts){ post in
                NavigationLink(destination: DetailView(url: post.url)) {
                    HStack {
                        Text(String(post.points))
                        Text(post.title)
                    }
                }
            }
        }
        .navigationBarTitle(Text("H4XOR N3W5"))
        .onAppear(perform: {
            self.networkManager.fetchData()
        })
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

//let posts = [
//    Post(id: "1", title: "hello"),
//    Post(id: "2", title: "goodbye"),
//    Post(id: "3", title: "suh dude")
//]
