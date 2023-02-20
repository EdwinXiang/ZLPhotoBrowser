//
//  EditCustomBottomView.swift
//  ZLPhotoBrowser
//
//  Created by Edwin on 2023/2/13.
//

import UIKit

class EditCustomBottomView: UIView {
    lazy var stackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 20
        stackView.backgroundColor = .zl.thumbnailBgColor
        stackView.axis = .horizontal
        return stackView
    }()
    lazy var shareButton: UIButton = {
        let shareButton = UIButton(type: .custom)
        shareButton.setImage(.zl.getImage("icon_share"), for: .normal)
        return shareButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(stackView)
        stackView.addArrangedSubview(shareButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        stackView.frame = self.bounds
        shareButton.frame = CGRect(origin: .zero, size: CGSize(width: 44, height: 44))
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
