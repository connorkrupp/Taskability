//
//  StagedTaskTableViewCell.swift
//  Taskability
//
//  Created by Connor Krupp on 16/03/2016.
//  Copyright © 2016 Connor Krupp. All rights reserved.
//

import UIKit

class StagedTaskTableViewCell: UITableViewCell {

    // MARK: Properties

    @IBOutlet weak var titleLabel: StrikethroughLabel!
    @IBOutlet weak var groupLabel: UILabel!
    @IBOutlet weak var checkmark: Checkmark!

    var isComplete = false {
        didSet {
            checkmark.isFilled = isComplete
            titleLabel.shouldStrike = isComplete
            titleLabel.textColor = isComplete ? UIColor.grayColor() : UIColor.darkTextColor()
        }
    }
}
