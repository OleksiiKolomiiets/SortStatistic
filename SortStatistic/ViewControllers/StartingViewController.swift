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
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   
    @IBOutlet weak var countOfElementInArray: UILabel!
    @IBOutlet weak var selectorForArrayCount: UISlider!
    @IBAction func tappedStartButton(_ sender: UIButton) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let statisticVC = storyboard.instantiateViewController(withIdentifier: "statisticInfoVC") as? StatisticInfoViewController else { return }
        
        self.navigationController?.pushViewController(statisticVC, animated: true)
    }
    

}
