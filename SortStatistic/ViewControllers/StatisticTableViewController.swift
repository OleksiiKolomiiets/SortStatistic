//
//  StatisticTableViewController.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class StatisticTableViewController: UITableViewController {

    
    var capacityOfMethods: Int {
        var count = 0
        while SortMethod(rawValue: count) != nil {
            count += 1
        }
        return count
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return capacityOfMethods
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as? StaticInfoTableViewCell else { return tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) }
        guard let sortMethod = SortMethod(rawValue: indexPath.row) else { return tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) }
        cell.configure(
            with: sortMethod ,
            rInfo: .random(capacityOfArray, 20) ,
            aInfo: .ascending(capacityOfArray, 20),
            dInfo: .descending(capacityOfArray, 20))
        
      
        // Configure the cell...

        return cell
    }

}

