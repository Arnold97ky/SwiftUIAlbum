//
//  ContentView.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import SwiftUI

struct ContentView<T: AlbumListViewModelType>: View {
    
    @ObservedObject var albumListVM: T
    
    var body: some View {
        // TODO: Figure out removing space at top of NavigationView
        NavigationView {
            VStack {
                Text("Albums")
                
                List {
                    ForEach(0..<self.albumListVM.albums.count, id: \.self) { index in
                        NavigationLink(destination: AlbumDetailView(albumVM: self.albumListVM, index: index)) {
                            AlbumView(albumListVM: self.albumListVM, index: index)
                                .onAppear {
                                    self.albumListVM.requestAlbumsIfNeeded(index: index)
                                }
                        }
                    }
                            
                    if self.albumListVM.isLoading {
                        ProgressView()
                    }
                }

            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(albumListVM: AlbumListViewModel())
    }
}
