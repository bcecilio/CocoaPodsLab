//
//  MainView.swift
//  CocoaPodsLab
//
//  Created by Brendon Cecilio on 3/3/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit
import SnapKit

class MainView: UIView {

    public lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
        return collection
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
        setupCollectionView()
    }
    
    private func setupCollectionView() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints { (make) in
            make.bottom.top.leading.trailing.equalTo(self)
        }
    }
}
