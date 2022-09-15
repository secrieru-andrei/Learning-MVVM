//
//  ViewController.swift
//  MVVM
//
//  Created by Secrieru Andrei on 13.09.2022.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: Properties
    private let tableView:UITableView = {
        let table = UITableView()
        table.register(PersonViewCell.self, forCellReuseIdentifier: PersonViewCell.identifier)
        return table
    }()
    
    private var models = [Person]()
    
    //MARK: Main
    override func viewDidLoad() {
        super.viewDidLoad()
        configureModel()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = view.bounds
        
    }
    
    //MARK: Functions
    
    private func configureModel(){
        let names = [
            "Ion",
            "Andrei",
            "Mircea",
            "Catalina",
            "Dima",
            "Emi"
        ]
        for name in names {
            let person = Person(name: name)
            models.append(person)
        }
    }
    
    
    
}
//MARK: Delegates
extension ViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PersonViewCell.identifier,
                                                       for: indexPath
        )as? PersonViewCell else { return UITableViewCell() }
        let model = models[indexPath.row]
        cell.configure(with: PersonViewModel(with: model))
        cell.delegate = self
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
}

extension ViewController: PersonViewCellDelegate {
    func personViewCell(_ cell: PersonViewCell, didTapWith viewModel: PersonViewModel) {
    }
    
}

