//
//  NewsTableViewController.swift
//  NewsAppSn
//
//  Created by Sharon Shen on 5/21/23.
//

import UIKit

class NewsTableViewController: UITableViewController, SourceManangerDelegate {
    
    var newsItems: [NewsItem]?
    var source: SourceManager?
    var selected: String? = nil
    
    func dataReceived(data: NewsPage) {
        self.newsItems = data.hits
        tableView.reloadData()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        source = SourceManager(delegate: self)
        source!.loadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return newsItems?.count ?? 0
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let item = newsItems?[indexPath.row]
        cell.textLabel?.text = item?.title
        cell.detailTextLabel?.text = String(item!.points)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selected = newsItems?[indexPath.row].url
        let detailVC = (storyboard?.instantiateViewController(identifier: "NewsDetailViewID"))! as DetailViewController
        detailVC.urlString = selected
        self.navigationController?.pushViewController(detailVC, animated: true)
    }
}
