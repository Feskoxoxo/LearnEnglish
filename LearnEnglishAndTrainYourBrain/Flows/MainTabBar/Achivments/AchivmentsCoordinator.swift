//
//  AchivmentsCoordinator.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import XCoordinator
import RxSwift
import RxCocoa

enum AchivmentsRouter: Route {
    
    case main
    case back
    case dismiss
    
}

class AchivmentsCoordinator: NavigationCoordinator<AchivmentsRouter> {
    
    init() {
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)
        
        rootViewController.navigationBar.isTranslucent = false
        rootViewController.setNavigationBarHidden(true, animated: false)
    }

    // MARK: Overrides
    override func prepareTransition(for route: AchivmentsRouter) -> NavigationTransition {
        switch route {
        case .main:
            
            let vc = AchivmentsMainViewController()
            
            return .set([vc])
            
        case .back:
            return .pop()
            
        case .dismiss:
            return .dismiss()
        }
    }
    
}
