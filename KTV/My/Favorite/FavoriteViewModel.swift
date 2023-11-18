//
//  FavoriteViewModel.swift
//  KTV
//
//  Created by 최안용 on 11/18/23.
//

import Foundation

@MainActor class FavoriteViewModel {
    private(set) var favorite: Favorite?
    var dataChanged: (() -> Void)?
    
    func request() {
        Task {
            do {
                let favorite = try await DataLoader.load(url: URLDefines.favorite, for: Favorite.self)
                self.favorite = favorite
                self.dataChanged?()
            } catch {
                print("favorite load failed \(error.localizedDescription)")
            }
        }
    }
}
