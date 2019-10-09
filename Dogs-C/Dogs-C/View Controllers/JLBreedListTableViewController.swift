//
//  JLBreedListTableViewController.swift
//  Dogs-C
//
//  Created by Jordan Lamb on 10/9/19.
//  Copyright © 2019 Squanto Inc. All rights reserved.
//

import UIKit

class JLBreedListTableViewController: UITableViewController {
    
    var fetchedBreeds: [JLBreed] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        JLBreedController.sharedInstance().fetchBreeds { (breed) in
            self.fetchedBreeds = breed
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fetchedBreeds.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "breedCell", for: indexPath)
        let breed = fetchedBreeds[indexPath.row]
        cell.textLabel?.text = breed.name
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let breed = self.fetchedBreeds[indexPath.row]
        if breed.subBreeds.count > 0 {
            performSegue(withIdentifier: "toSubBreedVC", sender: self)
        } else {
            performSegue(withIdentifier: "toImagesVC", sender: self)
        }
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toSubBreedVC" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            guard let destination = segue.destination as? JLSubBreedTableViewController else { return }
            let objectToSend = fetchedBreeds[index.row]
            destination.breeds = objectToSend
        } else if segue.identifier == "toImagesVC" {
            guard let index = tableView.indexPathForSelectedRow else { return }
            guard let destination = segue.destination as? JLImageCollectionViewController else { return }
            let objectToSend = fetchedBreeds[index.row]
            destination.breeds = objectToSend
        }
    }

}
