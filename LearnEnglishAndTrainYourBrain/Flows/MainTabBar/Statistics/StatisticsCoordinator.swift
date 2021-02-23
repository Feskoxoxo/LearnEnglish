//
//  AchivmentsCoordinator.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import XCoordinator
import RxSwift
import RxCocoa
import Swinject

enum StatisticsRouter: Route {
    
    case main
    case back
    case dismiss
    
}

class StatisticsCoordinator: NavigationCoordinator<StatisticsRouter> {

    private var container: Swinject.Container

    init(container: Swinject.Container) {
        self.container = container
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)
        
        rootViewController.navigationBar.isTranslucent = false
        rootViewController.setNavigationBarHidden(true, animated: false)
    }

    // MARK: Overrides
    override func prepareTransition(for route: StatisticsRouter) -> NavigationTransition {
        switch route {
        case .main:
            return .none()
            
        case .back:
            return .pop()
            
        case .dismiss:
            return .dismiss()
        }
    }
    
}
