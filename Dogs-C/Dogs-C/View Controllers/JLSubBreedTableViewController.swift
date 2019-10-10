//
//  JLSubBreedTableViewController.swift
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class JLSubBreedTableViewController: UITableViewController {
    
    var breeds: JLBreed? {
        didSet {
            tableView.reloadData()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subBreedCell", for: indexPath)
        guard let breeds = breeds else { return UITableViewCell() }
        let subBreeds = breeds.subBreeds[indexPath.row]
        cell.textLabel?.text = subBreeds
        return cell
    }

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
