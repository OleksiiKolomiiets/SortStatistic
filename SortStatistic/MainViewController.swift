//
//  ViewController.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let containerView = storyboard.instantiateViewController(withIdentifier: "statisticTVC") as? StatisticTableViewController else { return }
        self.navigationController?.pushViewController(containerView, animated: true)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

