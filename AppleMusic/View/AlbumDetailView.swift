//
//  AlbumDetailView.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import SwiftUI

struct AlbumDetailView<T: AlbumListViewModelType>: View {
    @ObservedObject var albumVM: T
    let index: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        VStack {
            AlbumView(albumListVM: self.albumVM, index: index)
            Text(self.albumVM.albums[index].name)
                .padding()
            Spacer()
            Button("Back") {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
            .navigationBarBackButtonHidden(true)
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(albumVM: AlbumListViewModel(), index: 0)
    }
}

