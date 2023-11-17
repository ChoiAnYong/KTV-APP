//
//  HomeRankingItemCell.swift
//  KTV
//
//  Created by 최안용 on 11/16/23.
//

import UIKit

class HomeRankingItemCell: UICollectionViewCell {
    
    static let identifier: String = "HomeRankingItemCell"
    
    @IBOutlet weak var thumbnailImageView: UIImageView!
    @IBOutlet weak var numberLabel: UILabel!
    private var imageTask: Task<Void, Never>?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 10
    }
    
    override func prepareForReuse() {
        //prepareForReuse의 역할은 셀이 재사용되기 전에 초기화해주는 역할 초기화가 제대로 되지 않으면 이전의 정보가 나온다.
        //적절하게 초기화 해줘야 의도치 않은 UI가 나오는 것을 방지할 수 있다.
        super.prepareForReuse()
        
        self.numberLabel.text = nil
        self.thumbnailImageView.image = nil
        self.imageTask?.cancel()
        self.imageTask = nil
    }
    
    func setData(_ data: Home.Ranking, rank: Int) {
        self.numberLabel.text = "\(rank)"
        self.imageTask = self.thumbnailImageView.loadImage(url: data.imageUrl)
    }
}
