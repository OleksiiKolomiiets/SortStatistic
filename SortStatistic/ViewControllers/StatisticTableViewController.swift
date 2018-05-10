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
    var sortModel = SortModel()
    var countOfArrayElments: Int?
   
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
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as? StaticInfoTableViewCell, let sortMethod = SortMethod(rawValue: indexPath.row),
        let countOfArrayElments = self.countOfArrayElments
            else { return tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) }
        self.sortModel.methodForSort = sortMethod
        self.sortModel.capacityOfArray = countOfArrayElments
        cell.configure(
            with: sortMethod,
            rInfo: .random(self.sortModel.capacityOfArray, self.sortModel.timeForSorting[0]) ,
            aInfo: .ascending(self.sortModel.capacityOfArray, self.sortModel.timeForSorting[1]),
            dInfo: .descending(self.sortModel.capacityOfArray, self.sortModel.timeForSorting[2]))
        return cell
    }

}

