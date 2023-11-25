//
//  VideoViewControllerContainer.swift
//  KTV
//
//  Created by 최안용 on 11/25/23.
//

import Foundation

protocol VideoViewControllerContainer {
    var videoViewController: VideoViewController? { get }
    func presentCurrentViewController()
    
}
