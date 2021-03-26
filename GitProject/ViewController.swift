//
//  ViewController.swift
//  GitProject
//
//  Created by Jayakrishnan u on 3/26/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var tableView: UITableView!
    var projects =  [Projects]()
    var prefetchTracker = Set<IndexPath>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        tableView.estimatedRowHeight = 200
        tableView.rowHeight = UITableView.automaticDimension
        tableView.register(UINib(nibName: "ProjectCell", bundle: nil), forCellReuseIdentifier: "cell")
        let apiService = APIService()
        apiService.getResponse(url: "https://api.github.com/orgs/intuit/repos", classType: Projects.self) { project in
            DispatchQueue.main.async {
                self.projects = project
                print(self.projects.count)
                self.tableView.reloadData()
            }
        }
        tableView.prefetchDataSource = self
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "detailVC", let destinationVC = segue.destination as? DetailViewController, let selectedProject = tableView.indexPathForSelectedRow {
            destinationVC.selectedProject = projects[selectedProject.row]
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return projects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProjectCell
        cell.name.text = projects[indexPath.row].name
        cell.details.text = projects[indexPath.row].description
//        cell.stars.text = String(projects[indexPath.row].stars)
//        cell.language.text = projects[indexPath.row].language
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       performSegue(withIdentifier: "detailVC", sender: self)
    }
    
    func tableView(_ tableView: UITableView,
                willDisplay cell: UITableViewCell,
                forRowAt indexPath: IndexPath) {
        print("Will Display \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView,
           didEndDisplaying cell: UITableViewCell,
           forRowAt indexPath: IndexPath) {
        
    }
    
}

extension ViewController: UITableViewDataSourcePrefetching {
    func tableView(_ tableView: UITableView, prefetchRowsAt indexPaths: [IndexPath]) {
        DispatchQueue.global(qos: .default).async {
            for i in indexPaths {
                print("prefetching ", i.row)
                if !self.prefetchTracker.contains(i) {
                    self.prefetchTracker.insert(i)
                }
            }
        }
    }
    
    
}
