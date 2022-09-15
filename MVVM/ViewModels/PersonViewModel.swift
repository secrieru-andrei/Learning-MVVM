//
//  PersonViewModel.swift
//  MVVM
//
//  Created by Secrieru Andrei on 15.09.2022.
//

import UIKit

struct PersonViewModel {
    let name: String
    let username: String
    var currentlyFollowing: Bool
    let image: UIImage?
    
    init(with model: Person){
        name = model.name
        username = model.username
        currentlyFollowing = false
        image = UIImage(systemName: "person")
    }
}
