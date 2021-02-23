//
//  BaseViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class BaseViewController: UIViewController {

    var shouldHideNavigationBar = false
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(shouldHideNavigationBar, animated: true)
    }

}
