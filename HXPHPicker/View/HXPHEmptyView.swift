//
//  HXPHEmptyView.swift
//  HXPHPickerExample
//
//  Created by Slience on 2020/12/29.
//  Copyright © 2020 洪欣. All rights reserved.
//

import UIKit

class HXPHEmptyView: UIView {
    lazy var titleLb: UILabel = {
        let titleLb = UILabel.init()
        titleLb.text = "没有照片".hx_localized
        titleLb.numberOfLines = 0
        titleLb.textAlignment = .center
        titleLb.font = UIFont.hx_semiboldPingFang(size: 20)
        return titleLb
    }()
    lazy var subTitleLb: UILabel = {
        let subTitleLb = UILabel.init()
        subTitleLb.text = "你可以使用相机拍些照片".hx_localized
        subTitleLb.numberOfLines = 0
        subTitleLb.textAlignment = .center
        subTitleLb.font = UIFont.hx_mediumPingFang(size: 16)
        return subTitleLb
    }()
    var config: HXPHEmptyViewConfiguration? {
        didSet {
            configColor()
        }
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLb)
        addSubview(subTitleLb)
    }
    
    func configColor() {
        titleLb.textColor = HXPHManager.shared.isDark ? config?.titleDarkColor : config?.titleColor
        subTitleLb.textColor = HXPHManager.shared.isDark ? config?.subTitleDarkColor : config?.subTitleColor
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let titleHeight = titleLb.text?.hx_stringHeight(ofFont: titleLb.font, maxWidth: hx_width - 20) ?? 0
        titleLb.frame = CGRect(x: 10, y: 0, width: hx_width - 20, height: titleHeight)
        let subTitleHeight = titleLb.text?.hx_stringHeight(ofFont: subTitleLb.font, maxWidth: hx_width - 20) ?? 0
        subTitleLb.frame = CGRect(x: 10, y: titleLb.frame.maxY + 3, width: hx_width - 20, height: subTitleHeight)
        hx_height = subTitleLb.frame.maxY
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        if #available(iOS 13.0, *) {
            if traitCollection.hasDifferentColorAppearance(comparedTo: previousTraitCollection) {
                configColor()
            }
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}