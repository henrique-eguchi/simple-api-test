//
//  BeersViewController.swift
//  simple-api-test
//
//  Created by Henrique Akiyoshi Eguchi on 28/10/19.
//  Copyright © 2019 Henrique Akiyoshi Eguchi. All rights reserved.
//

import UIKit

class BeersViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel: BeersViewModel?
    var fetchingMore = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupTableView()
        getBeers()
    }
    
    private func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
        let beerNib = UINib(nibName: "BeerTableViewCell", bundle: nil)
        tableView.register(beerNib, forCellReuseIdentifier: BeerTableViewCell.cellIdentifier)
        let loadingNib = UINib(nibName: "LoadingTableViewCell", bundle: nil)
        tableView.register(loadingNib, forCellReuseIdentifier: LoadingTableViewCell.cellIdentifier)
    }
    
    private func getBeers() {
        viewModel?.fetchBeers()
    }
}

extension BeersViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return viewModel?.numberOfBeers() ?? 0
        } else if section == 1 && fetchingMore {
            return 1
        }
        
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: BeerTableViewCell.cellIdentifier, for: indexPath) as! BeerTableViewCell
            cell.viewModel = viewModel?.viewModelForItemAt(indexPath: indexPath)
            cell.configure()
            return cell
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: LoadingTableViewCell.cellIdentifier, for: indexPath) as! LoadingTableViewCell
            cell.loadingSign.startAnimating()
            return cell
        }
    }
}

extension BeersViewController: UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        
        
        if offsetY > contentHeight - scrollView.frame.height * 4 {
            if !fetchingMore {
                fetchingMore = true
                viewModel?.fetchBeers()
            }
            
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        viewModel?.showBeerDetailsAt(indexPath: indexPath)
    }
}

extension BeersViewController: FetchBeersDelegate {
    func fetchBeersSuccess() {
        fetchingMore = false
        tableView.reloadData()
    }

    func fetchBeersFailure() {
        fetchingMore = false
    }
}
