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
    
    public var usersRandom = [Result]() {
        didSet {
            DispatchQueue.main.async {
                self.main.collectionView.reloadData()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
        main.collectionView.delegate = self
        main.collectionView.dataSource = self
        main.collectionView.register(UserCell.self, forCellWithReuseIdentifier: "userCell")
        getUsers()
    }
    
    override func viewDidAppear(_ animated: Bool) {
      
    }
    
    func getUsers() {
        APIClient.getUsers { [weak self] (result) in
            switch result {
            case .failure(let error):
                print("no users: \(error)")
            case .success(let user):
                self?.usersRandom = user
            }
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return usersRandom.count
    }
    
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? UserCell else {
            fatalError("could not downcast cell")
        }
        let userCell = usersRandom[indexPath.row]
        cell.configureCell(for: userCell)
        let animation = AnimationType.from(direction: .bottom, offset: 80.0)
//        let rotate = AnimationType.rotate(angle: CGFloat.pi/3)
//        cell.animate(animations: [animation])
//        cell.animate(animations: [rotate])
        cell.animate(animations: [animation], reversed: false, initialAlpha: 0.0, finalAlpha: 1.0, delay: 0.0, duration: 1.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: [.curveLinear], completion: nil)
//        let cells = collectionView.visibleCells(in: 1)
//        UIView.animate(views: cells, animations: [animation])
        cell.layer.cornerRadius = 10
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
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let users = usersRandom[indexPath.row]
        let detail = DetailController(userDetail: users)
        present(detail, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, didHighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            if let cell = collectionView.cellForItem(at: indexPath) as? UserCell {
                cell.imageView.transform = .init(scaleX: 0.80, y: 0.80)
                cell.contentView.backgroundColor = UIColor(red: 0.95, green: 0.95, blue: 0.95, alpha: 1)
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didUnhighlightItemAt indexPath: IndexPath) {
        UIView.animate(withDuration: 0.3) {
            if let cell = collectionView.cellForItem(at: indexPath) as? UserCell {
                cell.imageView.transform = .identity
                cell.contentView.backgroundColor = .clear
            }
        }
    }
}
