//
//  AppleMusicApp.swift
//  AppleMusic
//
//  Created by Arnold Sylvestre on 8/19/22.
//

import SwiftUI

@main
struct AppleMusicApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(albumListVM: AlbumListViewModel())
        }
    }
}
