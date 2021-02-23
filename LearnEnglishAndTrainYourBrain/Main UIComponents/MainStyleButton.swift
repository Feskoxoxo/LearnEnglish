//
// Created by Anton on 23.02.2021.
//

import UIKit
import Foundation

class MainStyleButton: UIButton {
    override init(frame: CGRect) {
        super.init(frame: frame)

        configureStyle()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        configureStyle()
    }

    private func configureStyle() {
        backgroundColor = UIColor.ApplicationColors.mainGreen
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 6
    }
}

