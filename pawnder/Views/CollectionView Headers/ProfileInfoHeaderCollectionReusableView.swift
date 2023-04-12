//
//  ProfileInfoHeaderCollectionReusableView.swift
//  pawnder
//
//  Created by Ninia Sabadze on 12.04.23.
//

import UIKit

protocol ProfileInfoHeaderCollectionReusableViewDelegate: AnyObject{

    func profileHeaderDidTapFollowersButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapFollowingButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapEditProfileButton(_ header: ProfileInfoHeaderCollectionReusableView)
    func profileHeaderDidTapAddPostButton(_ header: ProfileInfoHeaderCollectionReusableView)
}

final class ProfileInfoHeaderCollectionReusableView: UICollectionReusableView {
    static let identifier = "ProfileInfoHeaderCollectionReusableView"
    
    public weak var delegate: ProfileInfoHeaderCollectionReusableViewDelegate?
    
    private let profilePhotoImageView: UIImageView = {
       let imageView = UIImageView()
        imageView.backgroundColor = .red
        imageView.layer.masksToBounds = true
       return imageView
    }()
    
    private let followingButton: UIButton = {
       let button = UIButton()
        button.setTitle("Following", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
       return button
    }()
    
    private let followerButton: UIButton = {
       let button = UIButton()
        button.setTitle("Followers", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
       return button
    }()
    
    private let editProfileButton: UIButton = {
       let button = UIButton()
        button.setTitle("Edit Your Profile", for: .normal)
        button.setTitleColor(.label, for: .normal)
        button.backgroundColor = .secondarySystemBackground
       return button
    }()

    private let addPostButton: UIButton = {
       let button = UIButton()
        button.clipsToBounds = true
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        button.tintColor = UIColor(red: 0.58, green: 0.74, blue: 0.58, alpha: 1.00)
       return button
    }()
    
    private let nameLabel: UILabel = {
       let label = UILabel()
        label.text = "Joe Smith"
        label.textColor = .label
        label.numberOfLines = 1
       return label
    }()
    
    private let bioLabel: UILabel = {
       let label = UILabel()
        label.text = "This is the first account"
        label.textColor = .label
        label.numberOfLines = 0 //line wrap
       return label
    }()
    
    //MARK: - Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
        addButtonActions()
        clipsToBounds = true
    }
    
    private func addSubviews(){
        addSubview(profilePhotoImageView)
        addSubview(followerButton)
        addSubview(followingButton)
        addSubview(editProfileButton)
        addSubview(nameLabel)
        addSubview(bioLabel)
        addSubview(addPostButton)
    }
    
    private func addButtonActions(){
        followerButton.addTarget(self,
                                 action: #selector(didTapFollowerButton),
                                 for: .touchUpInside)
        
        followingButton.addTarget(self,
                                 action: #selector(didTapFollowingButton),
                                 for: .touchUpInside)
        
        editProfileButton.addTarget(self,
                                 action: #selector(didTapEditProfileButton),
                                 for: .touchUpInside)
        addPostButton.addTarget(self,
                                action: #selector(didTapAddPostButton),
                                for: .touchUpInside)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let profilePhotoSize = width/4
        profilePhotoImageView.frame = CGRect(
            x: 5,
            y: 5,
            width: profilePhotoSize,
            height: profilePhotoSize
        ).integral
        
        profilePhotoImageView.layer.cornerRadius = profilePhotoSize/2.0
        let buttonHeight = profilePhotoSize/2
        let countButtonWidth = (width-10-profilePhotoSize)/2
        
        followerButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        followingButton.frame = CGRect(
            x: followerButton.right,
            y: 5,
            width: countButtonWidth,
            height: buttonHeight
        ).integral
        
        editProfileButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHeight,
            width: countButtonWidth*2,
            height: buttonHeight
        ).integral
        
        addPostButton.frame = CGRect(
            x: profilePhotoImageView.right,
            y: 5 + buttonHeight*2,
            width: countButtonWidth*2,
            height: buttonHeight
        ).integral
        
        nameLabel.frame = CGRect(
            x: 5,
            y: 5 + addPostButton.bottom,
            width: width-10,
            height: 50
        ).integral
        
        let bioLabelSize = bioLabel.sizeThatFits(self.frame.size)
        bioLabel.frame = CGRect(
            x: 5,
            y: 5 + nameLabel.bottom,
            width: width-10,
            height: bioLabelSize.height
        ).integral
    }
    
    //MARK: - Actions
    @objc private func didTapFollowerButton(){
        delegate?.profileHeaderDidTapFollowersButton(self)
    }
    
    @objc private func didTapFollowingButton(){
        delegate?.profileHeaderDidTapFollowingButton(self)
    }
    
    @objc private func didTapEditProfileButton(){
        delegate?.profileHeaderDidTapEditProfileButton(self)
    }
    @objc private func didTapAddPostButton(){
        delegate?.profileHeaderDidTapAddPostButton(self)
    }
}
