//
//  SeekbarView.swift
//  KTV
//
//  Created by 최안용 on 11/23/23.
//

import UIKit

protocol SeekbarViewDelegate: AnyObject {
    
    func seekbar(_ seekbar: SeekbarView, seekToPercent percent: Double)
}

class SeekbarView: UIView {
    
    @IBOutlet weak var totalPlayTimeView: UIView!
    @IBOutlet weak var playablePlayTimeView: UIView!
    @IBOutlet weak var currentPlayTimeView: UIView!
    @IBOutlet weak var playableTimeWidth: NSLayoutConstraint!
    @IBOutlet weak var playTimeWidth: NSLayoutConstraint!
    
    private(set) var totalPlayTime: Double = 0
    private(set) var playableTime: Double = 0
    private(set) var currentPlayTime: Double = 0
    
    weak var delegate: SeekbarViewDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.totalPlayTimeView.layer.cornerRadius = 1
        self.playablePlayTimeView.layer.cornerRadius = 1
        self.currentPlayTimeView.layer.cornerRadius = 1
    }
    
    func setTotalPlayTime(_ totalPlayTime: Double) {
        self.totalPlayTime = totalPlayTime
        
        self.update()
    }
    
    func setPlayTime(_ playTime: Double, playableTime: Double) {
        self.currentPlayTime = playTime
        self.playableTime = playableTime
        
        self.update()
    }
    
    //터치가 시작될 때
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        guard let touch = touches.first else {
            return
        }
        
        self.updatePlayedWidth(touch: touch)
    }
    
    //터치가 이동되었을 때
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        self.updatePlayedWidth(touch: touch)
    }
    
    //터치가 끝났을 때
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        self.updatePlayedWidth(touch: touch)
    }
    
    //터치가 취소되었을 때
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
            return
        }
        
        self.updatePlayedWidth(touch: touch)
    }
    
    private func updatePlayedWidth(touch: UITouch) {
        let xPosition = self.widthForTouch(touch)
        self.playTimeWidth.constant = xPosition
        
        self.delegate?.seekbar(self, seekToPercent: xPosition / self.frame.width)
    }
    
    private func update() {
        guard self.totalPlayTime > 0 else {
            return
        }
        
        self.playableTimeWidth.constant = self.widthForTime(self.playableTime)
        self.playTimeWidth.constant = self.widthForTime(self.currentPlayTime)
        
        UIView.animate(
            withDuration: 0.2
        ) {
            //frame, bounds, alpha 0~1 이러한 수치 등을 바꿀 수 있고 alpha 값을 0~1로 바꾸면서 Fade in Fade out 효과를 처리해줄 수 있다.
            self.layoutIfNeeded()
        }
    }
    private func widthForTime(_ time: Double) -> CGFloat {
        min(self.frame.width, self.frame.width * time / self.totalPlayTime)
    }
    
    private func widthForTouch(_ touch: UITouch) -> CGFloat {
        min(touch.location(in: self).x, self.playableTimeWidth.constant)
    }
}
