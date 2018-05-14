//
//  ViewController.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class StatisticInfoViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        progressBar.progress = 0.0
        progressTitleLable.text = "0%"
        embededTVC?.countOfArrayElments = countOfArrayElments
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    var progressValue: Int = 0 {
        didSet {
            if progressValue > 100 { progressValue = 20 }
            if progressTitleLable != nil {
                progressTitleLable.text = "\(progressValue)%"
            }
        }
    }
    
    @IBOutlet weak var progressTitleLable: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var containerView: UIView!
    var countOfArrayElments: Int?
    var embededTVC: StatisticTableViewController?
    
    @IBAction func tappedRefreshButton(_ sender: UIButton) {
        self.viewDidLoad()
        embededTVC?.viewDidLoad()
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let embededTVC = segue.destination as? StatisticTableViewController {
            self.embededTVC = embededTVC
            self.embededTVC?.parentVC = self
        }
    }
    
}

