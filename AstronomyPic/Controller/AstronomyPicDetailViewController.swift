//
//  AstronomyPicDetailViewController.swift
//  AstronomyPic
//
//  Created by user on 28/11/21.
//

import UIKit

class AstronomyPicDetailViewController: UIViewController {
    @IBOutlet weak var AstronomyPicDetailTableView: UITableView!
    var pictureDetailViewModel: AstronomyPicDetailViewModel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Picture Detail"
        activityIndicator.startAnimating()
        setupViewModel()
        setupTableView()
    }
    
    func setupTableView() {
        self.AstronomyPicDetailTableView.estimatedRowHeight = UITableView.automaticDimension
        self.AstronomyPicDetailTableView.sectionHeaderHeight = UITableView.automaticDimension
        self.AstronomyPicDetailTableView.estimatedRowHeight = 200
        self.AstronomyPicDetailTableView.estimatedSectionHeaderHeight = 64
        self.AstronomyPicDetailTableView.tableFooterView = UIView(frame: .zero)
    }
    
    func setupViewModel() {
        pictureDetailViewModel = AstronomyPicDetailViewModel()
        pictureDetailViewModel.apiResponse = { [weak self] (error) in
            DispatchQueue.main.async {
                self?.activityIndicator.stopAnimating()
            }
            guard let self = self else { return }
            guard error == nil else {
                self.showAlertMessage(Constants.alerttitle, error?.message ?? "")
                return
            }
            self.updateUI()
        }
    }
    
    func updateUI() {
        DispatchQueue.main.async {
            self.AstronomyPicDetailTableView.reloadData()
        }
    }
}


extension AstronomyPicDetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pictureDetailViewModel.pictureDetail?.title == nil ? 0:1
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UINib(nibName: HeaderTitleTableViewCell.identifier, bundle: nil).instantiate(withOwner: nil, options: nil)[0] as! HeaderTitleTableViewCell
        view.titleLbl.text = pictureDetailViewModel.pictureDetail?.title
        return view
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AstronomyPicDetailTableViewCell.identifier, for: indexPath) as? AstronomyPicDetailTableViewCell else{
            return UITableViewCell()
        }
        cell.configureUI(pictureDetailViewModel.pictureDetail)
        return cell
    }
}


