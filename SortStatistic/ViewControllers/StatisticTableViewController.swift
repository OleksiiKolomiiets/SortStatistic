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
    var parentVC: StatisticInfoViewController!
   
    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.global().async {
            UIView.animate(withDuration: 1, animations: {
                self.makeStatisticSort(for: .insertSort)
                self.makeStatisticSort(for: .selection)
                self.makeStatisticSort(for: .buble)
            })
        }
        OperationQueue().addOperation {
            UIView.animate(withDuration: 1, animations: {
                self.makeStatisticSort(for: .quickSort)
                self.makeStatisticSort(for: .merge)
            })
        }
    }

    private func makeStatisticSort(for method: SortMethod) {
        DispatchQueue.main.sync {
            guard let countOfArrayElments = self.countOfArrayElments else { return }
            self.sortModel.capacityOfArray = countOfArrayElments
            self.sortModel.methodForSort = method
            self.tableView.reloadRows(at: [IndexPath(row: 0, section: method.rawValue )], with: UITableViewRowAnimation.automatic)
            parentVC.progressBar.progress +=  0.2
            parentVC.progressValue += 20
        }
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return capacityOfMethods
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "statisticCell", for: indexPath) as? StaticInfoTableViewCell else { return UITableViewCell() }
        guard let countOfArrayElments = self.countOfArrayElments, let method = SortMethod(rawValue: indexPath.section) else { return UITableViewCell() }
        let timeForSorting = self.sortModel.timeForSorting.isEmpty ? [0.0, 0.0, 0.0] : self.sortModel.timeForSorting
        
        cell.configure(with: method,
            rInfo: .random(countOfArrayElments, timeForSorting[0]),
            aInfo: .ascending(countOfArrayElments, timeForSorting[1]),
            dInfo: .descending(countOfArrayElments, timeForSorting[2]))
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: tableView.bounds.width, height: 25))
        view.backgroundColor = #colorLiteral(red: 1, green: 0.5781051517, blue: 0, alpha: 0.3919670245)
        let label = UILabel(frame: CGRect(x: 15, y: 0, width: tableView.bounds.width, height: 25))
        label.text = SortMethod(rawValue: section)?.description ?? "default"
        label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        label.textAlignment = .center
        view.addSubview(label)
        return view
    }    
    

}

