

import SwiftUI

struct ContentView: View {
    @ObservedObject var networkManager = NetworkManager()
    
    var body: some View {
        ZStack {
            if networkManager.loaded {
                NavigationView {
                    List(networkManager.posts) { post in
                        NavigationLink(destination: DetailView(url: post.url)) {
                            HStack {
                                Text(String(post.points))
                                Text(post.title)
                            }
                        }
                    }
                    .navigationBarTitle("H4X0R NEWS")
                }
               
            }  else {
                ProgressView()
            }
            
        }
        .onAppear {
            self.networkManager.fetchData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}




