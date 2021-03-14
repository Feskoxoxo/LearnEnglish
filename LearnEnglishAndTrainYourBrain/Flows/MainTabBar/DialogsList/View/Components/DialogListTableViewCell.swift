//
//  DialogListTableViewCell.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 14.03.2021.
//

import UIKit
import Kingfisher

class DialogListTableViewCell: UITableViewCell {

    @IBOutlet private weak var dialogImageView: UIImageView!
    @IBOutlet private weak var lastMessageLabel: UILabel!

    func setup(dialog: DialogListElement) {
        lastMessageLabel.text = dialog.lastMessage

        if let url = dialog.imageUrl {
            dialogImageView.kf.setImage(with: url)
        } else {
            dialogImageView.image = nil
        }
    }

}
