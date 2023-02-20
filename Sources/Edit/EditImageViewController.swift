//
//  EditImageViewController.swift
//  ZLPhotoBrowser
//
//  Created by Edwin on 2023/2/13.
//

import UIKit

class EditImageViewController: UIViewController {
    var images: [ZLEditImageModel] = [] {
        didSet {
            collectionView.reloadData()
        }
    }
    
    lazy var titleView: EditCustomNavigationView = {
        let titleView = EditCustomNavigationView()
        titleView.titleLabel.text = "2023-02-12"
        return titleView
    }()
    lazy var bottomView: EditCustomBottomView = {
        let bottomView = EditCustomBottomView()
        return bottomView
    }()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .zl.thumbnailBgColor
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.alwaysBounceVertical = true
        if #available(iOS 11.0, *) {
            collectionView.contentInsetAdjustmentBehavior = .always
        }
        EditImageListCell.zl.register(collectionView)
        EditImageGrideCell.zl.register(collectionView)
        return collectionView
    }()
    
    override var prefersStatusBarHidden: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return ZLPhotoUIConfiguration.default().statusBarStyle
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(titleView)
        view.addSubview(collectionView)
        view.addSubview(bottomView)
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
    }
}

extension EditImageViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EditImageListCell.zl.identifier, for: indexPath)
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
}
