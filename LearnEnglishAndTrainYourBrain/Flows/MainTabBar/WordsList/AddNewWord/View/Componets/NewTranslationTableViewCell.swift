//
//  NewTranslationTableViewCell.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 23.02.2021.
//

import UIKit

class NewTranslationTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var originalTitleLabel: UILabel!
    @IBOutlet private weak var translateTitleLabel: UILabel!
    @IBOutlet private weak var originalTextField: UITextField!
    @IBOutlet private weak var translateTextField: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
