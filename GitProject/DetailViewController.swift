//
//  DetailViewController.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import UIKit

class DetailViewController: UIViewController {

    var selectedProject: Projects!
    var issue = [Issue]()
    let searchController = UISearchController(searchResultsController: nil)
    @IBOutlet var detailTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        detailTableView.delegate = self
        detailTableView.dataSource = self
        detailTableView.estimatedRowHeight = 200
        detailTableView.rowHeight = UITableView.automaticDimension
        detailTableView.register(UINib(nibName: "IssueDetailCell", bundle: nil), forCellReuseIdentifier: "detailCell")
        print(selectedProject)
        let apiService = APIService()
        apiService.getResponse(url: "https://api.github.com/repos/intuit/\(selectedProject.name)/issues", classType: Issue.self) { issue in
            DispatchQueue.main.async {
                self.issue = issue
                self.detailTableView.reloadData()
            }
        }
        configureSearchBar()
        // Do any additional setup after loading the view.
    }
    
    func configureSearchBar() {
        let offset = CGPoint(x: 0, y: 44)
        detailTableView.setContentOffset(offset, animated: true)
        searchController.searchBar.delegate = self
        detailTableView.tableHeaderView = searchController.searchBar
    }



}
extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return issue.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

            let cell = tableView.dequeueReusableCell(withIdentifier: "detailCell", for: indexPath) as! IssueDetailCell
            cell.issueTitle.text = issue[indexPath.row].title
            cell.issueDescription.text = issue[indexPath.row].title
            return cell
   
        
    }
    
    
    
}

extension DetailViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        print(searchBar.text)
    }
}
