//
//  ViewController.swift
//  CocoaPodsLab
//
//  Created by Brendon Cecilio on 3/2/20.
//  Copyright © 2020 Brendon Cecilio. All rights reserved.
//

import UIKit
import ViewAnimator

class ViewController: UIViewController {
    
    private let main = MainView()
    
    override func loadView() {
        view = main
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        main.collectionView.delegate = self
        main.collectionView.dataSource = self
        main.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
    }

    func animate(animations: [Animation],
    reversed: Bool = false,
    initialAlpha: CGFloat = 0.0,
    finalAlpha: CGFloat = 1.0,
    delay: Double = 0,
    duration: TimeInterval = ViewAnimatorConfig.duration,
    usingSpringWithDamping dampingRatio: CGFloat = ViewAnimatorConfig.springDampingRatio,
    initialSpringVelocity velocity: CGFloat = ViewAnimatorConfig.initialSpringVelocity,
    completion: (() -> Void)? = nil) {
        
    }
}

extension UIViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath)
        cell.backgroundColor = .white
        return cell
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let maxSize: CGSize = UIScreen.main.bounds.size
        let spacingBetweenItems: CGFloat = 11
        let numberOfItems: CGFloat = 3
        let totalSpacing: CGFloat = (2 * spacingBetweenItems) + (numberOfItems - 1) * numberOfItems
        let itemWidth: CGFloat = (maxSize.width - totalSpacing) / numberOfItems
        let itemHeight: CGFloat = maxSize.height * 0.20
        return CGSize(width: itemWidth, height: itemHeight)
    }
    
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }
}
