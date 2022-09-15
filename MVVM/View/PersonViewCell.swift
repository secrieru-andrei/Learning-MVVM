//
//  PersonViewCell.swift
//  MVVM
//
//  Created by Secrieru Andrei on 13.09.2022.
//

import UIKit

protocol PersonViewCellDelegate: AnyObject {
    func personViewCell(_ cell: PersonViewCell,
                        didTapWith viewModel: PersonViewModel)
}

class PersonViewCell: UITableViewCell {
    
    //MARK: Properties
    weak var delegate: PersonViewCellDelegate?
    private var viewModel: PersonViewModel?
    
    static let identifier = "Cell"
    
    private let userImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private let usernameLabel: UILabel = {
        let username = UILabel()
        username.textColor = .secondaryLabel
        return username
    }()
    
    private let nameLabel: UILabel = {
        let name = UILabel()
        name.textColor = .label
        return name
    }()
    
    private let followButton: UIButton = {
        let button = UIButton()
        return button
    }()
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubview(followButton)
        contentView.addSubview(nameLabel)
        contentView.addSubview((usernameLabel))
        contentView.addSubview(userImageView)
        contentView.clipsToBounds = true
        followButton.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
    }
    
    @objc private func didTapButton(){
        guard let viewModel = viewModel else {return}
        var newModel = viewModel
        newModel.currentlyFollowing = !viewModel.currentlyFollowing
        delegate?.personViewCell(self, didTapWith: newModel)
        prepareForReuse()
        configure(with: newModel)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    func configure(with viewModel: PersonViewModel){
        self.viewModel = viewModel
        usernameLabel.text = viewModel.username
        nameLabel.text = viewModel.name
        userImageView.image = viewModel.image
        
        if viewModel.currentlyFollowing {
            followButton.setTitle("Unfollow", for: .normal)
            followButton.setTitleColor(.blue, for: .normal)
            followButton.layer.borderWidth = 1
            followButton.layer.borderColor = UIColor.white.cgColor
            
        } else {
            
            followButton.setTitle("Follow", for: .normal)
            followButton.setTitleColor(.white , for: .normal)
            followButton.backgroundColor = .link
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let imageWidth = contentView.frame.size.height - 10
        userImageView.frame = CGRect(x: 5, y: 5, width: imageWidth, height: imageWidth)
        nameLabel.frame = CGRect(x: imageWidth + 10,
                                 y: 0,
                                 width: contentView.frame.size.width - imageWidth,
                                 height: contentView.frame.size.height / 2)
        usernameLabel.frame = CGRect(x: imageWidth + 10,
                                     y: contentView.frame.size.height / 2,
                                     width: contentView.frame.size.width - imageWidth,
                                     height: contentView.frame.size.height / 2)
        followButton.frame = CGRect(x: contentView.frame.size.width - 120,
                                    y: 10,
                                    width: 110,
                                    height: contentView.frame.size.height - 20)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        nameLabel.text = nil
        usernameLabel.text = nil
        userImageView.image = nil
        followButton.backgroundColor = nil
        followButton.layer.borderWidth = 0
        followButton.setTitle(nil,
                              for: .normal)
    }

}
