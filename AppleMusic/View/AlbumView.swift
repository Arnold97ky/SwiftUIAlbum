//
//  AlbumView.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import SwiftUI

struct AlbumView<T: AlbumListViewModelType>: View {
    
    @ObservedObject var albumListVM: T
    let index: Int
    
    var body: some View {
        HStack {
            AsyncImage(url: NetworkParams.AlbumImage(self.albumListVM.albums[index].artworkUrl100 ).url) { realImage in
                realImage
                    .resizable()
                    .frame(width: 150, height: 200, alignment: .center)
            } placeholder: {
                ProgressView()
                    .frame(width: 150, height: 200, alignment: .center)
            }
                .padding([.top, .bottom, .trailing], 8)
            Text(albumListVM.albums[index].artistName)
                .padding([.top, .bottom, .trailing], 8)
        }
        .listRowInsets(EdgeInsets(top: 0, leading: 2, bottom: 0, trailing: 0))
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumView(albumListVM: AlbumListViewModel(), index: 0)
    }
}

