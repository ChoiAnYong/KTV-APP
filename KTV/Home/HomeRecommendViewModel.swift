//
//  HomeRecommendViewModel.swift
//  KTV
//
//  Created by 최안용 on 11/17/23.
//

import Foundation

class HomeRecommendViewModel {
    private(set) var isFolded: Bool = true {
        didSet {
            self.foldChanged?(self.isFolded)
        }
    }
    
    var foldChanged: ((Bool) -> Void)?
    
    var recommends: [VideoListItem]?
    var itemCount: Int {
        let count = self.isFolded ? 5 : self.recommends?.count ?? 0
        
        return min(self.recommends?.count ?? 0, count)
    }
    
    func toggleFoldstate() {
        self.isFolded.toggle()
    }
}
