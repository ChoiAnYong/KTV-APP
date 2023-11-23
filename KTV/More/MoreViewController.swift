//
//  MoreViewController.swift
//  KTV
//
//  Created by 최안용 on 11/19/23.
//

import UIKit

class MoreViewController: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var headerView: UIView!
    private let viewModel = MoreViewModel()
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
         
        self.modalPresentationStyle = .overFullScreen
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        self.modalPresentationStyle = .overFullScreen
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.rowHeight = 48
        self.tableView.register(
            UINib(nibName:  MoreTableViewCell.identifier, bundle: nil),
            forCellReuseIdentifier: MoreTableViewCell.identifier
        )
        self.setupConerRadius()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        self.setupConerRadius()
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        
        self.setupConerRadius()
        coordinator.animate { _ in
            self.setupConerRadius()
        }
        
        super.viewWillTransition(to: size, with: coordinator)
    }
    
    @IBAction func closeDidTap(_ sender: Any) {
        self.dismiss(animated: false)//modal로 띄운 뷰에 대한 닫기를 가능하게 함(animated를 true로 하면 창이 올라오는 모션이 나온다.
    }
    
    private func setupConerRadius() {
        let path = UIBezierPath(
            roundedRect: self.headerView.bounds,
            byRoundingCorners: [.topLeft, .topRight],
            cornerRadii: CGSize(width: 13, height: 13)
        )
        let maskLayer = CAShapeLayer()
        maskLayer.path = path.cgPath
        self.headerView.layer.mask = maskLayer
        
    }
}

extension MoreViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.viewModel.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MoreTableViewCell.identifier, for: indexPath)
        
        if let cell = cell as? MoreTableViewCell {
            cell.setItem(self.viewModel.items[indexPath.row], separatorHidden: indexPath.row + 1 == self.viewModel.items.count)
        }
        
        return cell
    }
}
