//
//  StaticInfoTableViewCell.swift
//  SortStatistic
//
//  Created by Oleksii Kolomiiets on 5/10/18.
//  Copyright © 2018 Oleksii Kolomiiets. All rights reserved.
//

import UIKit

class StaticInfoTableViewCell: UITableViewCell {

    @IBOutlet weak var titleOfSortMethodLable: UILabel!
    
    @IBOutlet weak var randomSortedArrayInfoLable: UILabel!
    @IBOutlet weak var ascSortedArrayInfoLable: UILabel!
    @IBOutlet weak var descSortedArrayInfoLable: UILabel!
    
    func configure(with title: SortMethod, rInfo: ArrayType, aInfo: ArrayType, dInfo: ArrayType) {
        titleOfSortMethodLable.text = title.description
        randomSortedArrayInfoLable.text = rInfo.description
        ascSortedArrayInfoLable.text = aInfo.description
        descSortedArrayInfoLable.text = dInfo.description
    }
}


