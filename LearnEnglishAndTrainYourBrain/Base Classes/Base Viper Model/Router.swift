//
//  Router.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 14.03.2021.
//

import UIKit

protocol Router {
    var navigation: UINavigationController? { get }
}

protocol TransitionHandler: AnyObject {
    func pushModule(_ controller: UIViewController, animated: Bool)
    func presentModule(_ controller: UIViewController, animated: Bool, completion: (() -> Void)?)
    func dismissModule(animated: Bool, completion: (() -> Void)?)
}


extension UIViewController: TransitionHandler {
    func pushModule(_ controller: UIViewController, animated: Bool) {
        navigationController?.pushViewController(controller, animated: animated)
    }

    func presentModule(_ controller: UIViewController, animated: Bool, completion: (() -> Void)?) {
        present(controller, animated: animated, completion: completion)
    }
    
    func dismissModule(animated: Bool, completion: (() -> Void)?) {
        dismiss(animated: animated, completion: completion)
    }
}
