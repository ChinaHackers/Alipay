//
//  HotSearchCollectionViewCell.swift
//  SimpleSugars
//
//  Created by 苑伟 on 2016/10/19.
//  Copyright © 2016年 苑伟. All rights reserved.
//

import UIKit
import SnapKit


// MARK: - 热门搜索cell
class HotSearchCollectionViewCell: UICollectionViewCell {
    
    // MARK: - 懒加载    
    /// 排行榜数字
    lazy var RankLabel: UILabel = {
        
        let rankLabel = UILabel(frame: CGRect(x: 0, y: 0, width: 25, height: 30))
        rankLabel.textAlignment = .center
        rankLabel.textColor = UIColor.white
        return rankLabel
    }()
    
    /// 热门搜索中 按钮
    lazy var hotButton: UIButton = {
        
        let hotButton = UIButton(type: .custom)
        // 设置按钮 边框\背景颜色
        hotButton.backgroundColor = UIColor(red:0.07, green:0.14, blue:0.19, alpha:1.00)
//        hotButton.layer.borderColor = UIColor.white.cgColor
        
        // 边框宽度
        hotButton.layer.borderWidth = 0.5
        
        // 设置按钮圆角
        hotButton.layer.cornerRadius = 5
        hotButton.layer.masksToBounds = true
        
        // 开启按钮交互
        hotButton.isUserInteractionEnabled = true
        
        // 设置文字颜色\字体大小\对齐方式
        hotButton.setTitleColor(UIColor.white, for: .normal)
        hotButton.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        
        // 按钮文字对齐方式
        hotButton.contentHorizontalAlignment = UIControlContentHorizontalAlignment.left
        
        // 居左显示很难看，太靠边了。设置UIButton的文字边距
        hotButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 30, bottom: 0, right: 0)
        
        return hotButton
    }()
    
    
    /// 删除按钮
   lazy var deleteButton: UIButton = {
        let deleteButton = UIButton(type: .custom)
        deleteButton.setImage(UIImage(named:"delete"), for: .normal)
        deleteButton.isUserInteractionEnabled = true
        return deleteButton
    }()
    
    
    /// 容器视图
   private lazy var containerView:UIView = {
        let containerView = UIView()
        containerView.backgroundColor = UIColor.clear
        containerView.isUserInteractionEnabled = true
        return containerView
    }()
    // MARK: - 构造函数
    private override init(frame: CGRect) {
        super.init(frame: frame)
        
        // MARK: -添加控件
        
        //contentView: 自定义添加子视图的单元格的内容视图
        
        contentView.addSubview(containerView)
        
        containerView.frame = contentView.bounds
        
        // 添加按钮到容器里
        containerView.addSubview(hotButton)
        containerView.addSubview(deleteButton)
        hotButton.addSubview(RankLabel)
        
        hotButton.frame = contentView.bounds
       
        // 默认隐藏删除按钮
        deleteButton.isHidden = true
        
        //布局删除按钮
        deleteButton.snp.makeConstraints { (make) in
            make.width.height.equalTo(15)
            make.top.equalTo(hotButton.snp.top).offset(-5)
            make.right.equalTo(hotButton.snp.right).offset(5)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
