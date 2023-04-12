//
//  ProfileTabsCollectionReusableView.swift
//  pawnder
//
//  Created by Ninia Sabadze on 12.04.23.
//

import UIKit

protocol ProfileTabsCollectionReusableViewDelegate: AnyObject{
    func didTapGridButtonTab()
    func didTapScheduleButtonTab()
}

class ProfileTabsCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileTabsCollectionReusableView"
    public weak var delegate: ProfileTabsCollectionReusableViewDelegate?
    
    struct Constants{
        static let padding: CGFloat = 8
    }
    
    private let gridButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = UIColor(red: 0.58, green: 0.74, blue: 0.58, alpha: 1.00)
        button.setBackgroundImage(UIImage(systemName: "square.grid.2x2"), for: .normal)
        return button
    }()
    
    private let scheduleButton: UIButton = {
        let button = UIButton()
        button.clipsToBounds = true
        button.tintColor = .lightGray
        button.setBackgroundImage(UIImage(systemName: "calendar"), for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .systemBackground
        addSubview(gridButton)
        addSubview(scheduleButton)
        
        gridButton.addTarget(self,
                             action: #selector(didTapGridButton),
                             for: .touchUpInside)
        scheduleButton.addTarget(self,
                             action: #selector(didTapScheduleButton),
                             for: .touchUpInside)
    }
    
    @objc private func didTapGridButton(){
        gridButton.tintColor = UIColor(red: 0.58, green: 0.74, blue: 0.58, alpha: 1.00)
        scheduleButton.tintColor = .lightGray
        delegate?.didTapGridButtonTab()
    }
    
    @objc private func didTapScheduleButton(){
        gridButton.tintColor = .lightGray
        scheduleButton.tintColor = UIColor(red: 0.58, green: 0.74, blue: 0.58, alpha: 1.00)
        delegate?.didTapScheduleButtonTab()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let size = height - (Constants.padding*2)
        let gridButtonX = ((width/2)-size)/2
        
        gridButton.frame = CGRect(
            x: gridButtonX,
            y: Constants.padding,
            width: size,
            height: size
        )
        
        scheduleButton.frame = CGRect(
            x: gridButtonX + (width/2),
            y: Constants.padding,
            width: size,
            height: size
        )
    }
}
