//
//  DetailController.swift
//  CocoaPodsLab
//
//  Created by Brendon Cecilio on 3/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit

class DetailController: UIViewController {
    
    private let detailView = DetailView()
    
    private var userDetail: Result
    
    init(userDetail: Result) {
        self.userDetail = userDetail
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = detailView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        updateUI(for: userDetail)
    }
    
    private func updateUI(for user: Result) {
        detailView.userNameLabel.text = "\(user.name.first) \(user.name.last)"
        detailView.userEmailLabel.text = user.email
        let image = user.picture.large
        detailView.imageView.getImage(with: image) { [weak self] (result) in
            switch result {
            case .failure(_):
                self?.detailView.imageView.image = UIImage(systemName: "person.circle.fill")
            case .success(let image):
                self?.detailView.imageView.image = image
            }
        }
    }
}
