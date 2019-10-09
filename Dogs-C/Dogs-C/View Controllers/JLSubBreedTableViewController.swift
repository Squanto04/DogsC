//
//  JLSubBreedTableViewController.swift
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class JLSubBreedTableViewController: UITableViewController {
    
    var breeds: JLBreed?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let breeds = breeds {
            return breeds.subBreeds.count
        } else {
            return 0
        }
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subBreedCell", for: indexPath)
        if let breeds = breeds {
            let subBreeds = breeds.subBreeds[indexPath.row]
            cell.textLabel?.text =
            return cell
        } else {
        return UITableViewCell()
        }
    }

    // MARK: - Navigation


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

    }
}
