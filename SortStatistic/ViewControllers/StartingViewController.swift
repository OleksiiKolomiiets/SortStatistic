//
//  StartingViewController.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class StartingViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let number = Int(countSelectorSlider.value)
        self.countOfArrayElments = Int(number)
        self.countOfElementInArray.text = String(number)
        // Do any additional setup after loading the view.
    }
    
    var countOfArrayElments: Int?

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @IBOutlet weak var countSelectorSlider: UISlider!
    
    @IBAction func changeValue(_ sender: UISlider) {
        let value = Int(sender.value)
        countOfElementInArray.text = String(value)
        countOfArrayElments = value
    }
    
    @IBOutlet weak var countOfElementInArray: UILabel!
    @IBOutlet weak var selectorForArrayCount: UISlider!
    @IBAction func tappedStartButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let statisticVC = storyboard.instantiateViewController(withIdentifier: "statisticInfoVC") as? StatisticInfoViewController else { return }
        statisticVC.countOfArrayElments = self.countOfArrayElments
        self.navigationController?.pushViewController(statisticVC, animated: true)
    }
    

}
