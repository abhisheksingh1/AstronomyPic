//
//  AstronomyPicDetailViewController.swift
//  AstronomyPic
//
//  Created by user on 28/11/21.
//

import UIKit

class AstronomyPicDetailViewController: UIViewController {
    @IBOutlet weak var AstronomyPicDetailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        // Do any additional setup after loading the view.
    }
    
    func setupTableView() {
        self.AstronomyPicDetailTableView.estimatedRowHeight = UITableView.automaticDimension
        self.AstronomyPicDetailTableView.tableFooterView = UIView(frame: .zero)
    }
}


extension AstronomyPicDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, willDisplayHeaderView view: UIView, forSection section: Int) {
        guard let headerView = view as? UITableViewHeaderFooterView else { return }
        headerView.contentView.backgroundColor = .clear
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Header title"
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AstronomyPicDetailTableViewCell.identifier, for: indexPath) as? AstronomyPicDetailTableViewCell else{
            return UITableViewCell()
        }
        return cell
    }
}


