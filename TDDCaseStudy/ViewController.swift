//
//  ViewController.swift
//  TDDCaseStudy
//
//  Created by alexis on 19/04/21.
//

import UIKit

class ViewController: UITableViewController {
    var pictures = [String]()
    var pictureSelectAction: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        tableView.register(UITableViewCell.self,forCellReuseIdentifier: "Cell")
        navigationController?.navigationBar.prefersLargeTitles = true
        title = "Storm Viewer"
        
        let fm = FileManager.default
        var path = Bundle.main.resourcePath!
        print(path)
        
        path = path + "/Storms"
        let items = try! fm.contentsOfDirectory(atPath: path)
        for item in items {
            if item.hasPrefix("nssl") {
                pictures.append(item)
            }
        }
    }
    
    
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return pictures.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt
                                indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:
                                                    "Cell", for: indexPath)
        cell.accessoryType = .disclosureIndicator
        cell.textLabel?.text = pictures[indexPath.row]
        return cell
    }
    
    override func tableView(_ tableView: UITableView,
    didSelectRowAt indexPath: IndexPath) {
        pictureSelectAction?(pictures[indexPath.row])
    }
}
