//
//  DetailView.swift
//  CocoaPodsLab
//
//  Created by Brendon Cecilio on 3/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit
import SnapKit

class DetailView: UIView {
    
    public lazy var colorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.generateRandomColor()
        view.layer.cornerRadius = 10
        return view
    }()
    
    public lazy var imageView: UIImageView = {
        let image = UIImageView()
        image.layer.cornerRadius = 60
        return image
    }()
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    public lazy var userEmailLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        return label
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
        setupView()
        setupImage()
        setupName()
        setupEmail()
    }
    
    private func setupView() {
        addSubview(colorView)
        colorView.snp.makeConstraints { (make) in
            make.centerX.centerY.equalTo(self)
            make.width.equalTo(UIScreen.main.bounds.width)
            make.height.equalTo(UIScreen.main.bounds.height / 3)
            make.leading.equalTo(self).offset(20)
            make.trailing.equalTo(self).offset(-20)
        }
    }
    
    private func setupImage() {
        colorView.addSubview(imageView)
        imageView.snp.makeConstraints { (make) in
            make.top.leading.equalTo(colorView).offset(20)
        }
    }
    
    private func setupName() {
        colorView.addSubview(userNameLabel)
        userNameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(colorView).offset(50)
            make.leading.equalTo(colorView).offset(160)
        }
    }
    
    private func setupEmail() {
        colorView.addSubview(userEmailLabel)
        userEmailLabel.snp.makeConstraints { (make) in
            make.top.equalTo(colorView).offset(80)
            make.leading.equalTo(colorView).offset(160)
            make.trailing.equalTo(colorView).offset(-20)
        }
    }
}

extension UIColor {
    static func generateRandomColor() -> UIColor {
        let redValue = CGFloat.random(in: 0...1)
        let greenValue = CGFloat.random(in: 0...1)
        let blueValue = CGFloat.random(in: 0...1)
        let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 0.6)
        return randomColor
    }
}
