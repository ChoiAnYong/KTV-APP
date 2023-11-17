//
//  HomeViewModel.swift
//  KTV
//
//  Created by Lecture on 2023/09/08.
//

import Foundation

//MainActor로 선언한 이유는 뷰컨틀러가 MainActor에서 동작하고 있고  뷰 컨트롤러에서 뷰모델로 접근할 때도
//결국 MainActor에서 동작을 해야되고 실제로 dataChanged까지 데이터를 받았을 때 메인에서 동작을 해야하기 때문에
//네트워크 통신구간만 비동기 통신이 일어날 수 있게 처리하고 그 외 모든 동작들은 메인에서 돌아갈 수 있게끔
//동작을 보장하기 위해서이다.
@MainActor class HomeViewModel {
    private(set) var home: Home?
    let recommendViewModel: HomeRecommendViewModel = .init()
    var dataChanged: (() -> Void)?
    

    func requestData() {
        Task {
            do {
                self.home = try await DataLoader.load(url: URLDefines.home, for: Home.self)
                self.home = home
                self.recommendViewModel.recommends = home?.recommends
                self.dataChanged?()
            } catch {
                print("json parsing failed: \(error.localizedDescription)")
            }
        }
    }
}
