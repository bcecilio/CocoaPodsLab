//
//  UserCell.swift
//  CocoaPodsLab
//
//  Created by Brendon Cecilio on 3/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit
import SnapKit
import ImageKit

class UserCell: UICollectionViewCell {
    
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    public lazy var userNameLabel: UILabel = {
       let name = UILabel()
        return name
    }()
    
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    private func commonInit() {
        setupImage()
    }
    
    private func setupImage() {
        addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(self)
        }
    }
    
    public func configureCell(for user: Result) {
        let image = user.picture.large
        imageView.getImage(with: image) { [weak self] (result) in
            switch result {
            case .failure(_):
                DispatchQueue.main.async {
                    self?.imageView.image = UIImage(systemName: "person.fill.circle")
                }
            case .success(let image):
                DispatchQueue.main.async {
                    self?.imageView.image = image
                }
            }
        }
    }
}
