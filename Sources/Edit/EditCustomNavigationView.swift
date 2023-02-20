//
//  EditCustomNavigationView.swift
//  ZLPhotoBrowser
//
//  Created by Edwin on 2023/2/13.
//

import UIKit

class EditCustomNavigationView: UIView {
    lazy var returnButton: UIButton = {
        let returnButton = UIButton(type: .custom)
        returnButton.setImage(.zl.getImage("zl_navBack"), for: .normal)
        returnButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -10, bottom: 0, right: 0)
        return returnButton
    }()
    lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        
        return titleLabel
    }()
    lazy var selectedButton: UIButton = {
        let selectedButton = UIButton(type: .custom)
        selectedButton.setImage(.zl.getImage("icon_mute_selected"), for: .normal)
        return selectedButton
    }()
    lazy var grideButton: UIButton = {
        let grideButton = UIButton(type: .custom)
        grideButton.setImage(.zl.getImage("icon_gride"), for: .normal)
        return grideButton
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUpSubViews()
    }
    
    func setUpSubViews() {
        addSubview(returnButton)
        addSubview(titleLabel)
        addSubview(selectedButton)
        addSubview(grideButton)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonSize = CGSize(width: 34, height: 34)
        let frame = CGRectMake(20, zl.top, buttonSize.width, buttonSize.height)
        returnButton.frame = frame
        let titleWith = self.titleLabel.text?.zl.boundingRect(font: UIFont.systemFont(ofSize: 19, weight: .bold), limitSize: CGSize(width: 400, height: 40))
        if let titleWith = titleWith {
            titleLabel.frame = CGRectMake(center.x - titleWith.width/2, center.x - self.frame.size.height/2, titleWith.width, titleWith.height)
        }
        selectedButton.frame = CGRectMake(self.frame.size.width - 34 - 20, zl.top, buttonSize.width, buttonSize.height)
        grideButton.frame = CGRectMake(CGRectGetMinX(selectedButton.frame) - 34 - 12, zl.top, buttonSize.width, buttonSize.height)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
