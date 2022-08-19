//
//  AlbumListViewModel.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import Foundation
import Combine


protocol AlbumListViewModelType: ObservableObject {
    var albums: [Shark] { get }
    var isLoading: Bool { get }
    func requestAlbumsIfNeeded(index: Int)
}

class AlbumListViewModel: AlbumListViewModelType {
    
    private let networkService: NetworkService
    private var subs = Set<AnyCancellable>()
    @Published var albums: [Shark] = []
    var currentPage = 0
    @Published var isLoading: Bool = false
    
    init(network: NetworkService = NetworkManager()) {
        self.networkService = network
        self.requestAlbumsIfNeeded(index: 0)
    }
    
    func requestAlbumsIfNeeded(index: Int) {
        guard index == (self.albums.count - 1) || self.albums.isEmpty else { return }
        self.isLoading = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            self.requestAlbums()
        }
    }
    
    func requestAlbums() {
        self.networkService.getModel(url: NetworkParams.popularAlbum(self.currentPage + 1).url)
            .receive(on: DispatchQueue.main)
            .sink { completion in
                print(completion)
            } receiveValue: { [weak self] (page: Album100) in
                self?.albums.append(contentsOf: page.feed.results)
               // self?.currentPage = page.page
                self?.isLoading = false
            }.store(in: &self.subs)
    }
    
    
}
