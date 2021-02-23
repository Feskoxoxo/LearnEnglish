//
//  AppCoordinator.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit
import XCoordinator
import RxSwift
import RxCocoa
import Swinject

enum AppRoute: Route {
    
    case animatedSplashScreen
    case onboarding
    case main
    
}

class AppCoordinator: NavigationCoordinator<AppRoute> {
    
    private let disposeBag = DisposeBag()
    
    private var mainTabBarCoordinator: MainTabBarCoordinator?
    private var container: Swinject.Container
    private var routesQueue = [AppRoute]()
    
    init(container: Swinject.Container) {
        self.container = container

        let routeAfterSplash: AppRoute = {
            return .onboarding
        }()
        
        routesQueue = [routeAfterSplash]
        
//        super.init(rootViewController: BaseNavigationController(), initialRoute: .animatedSplashScreen)
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)

        rootViewController.setNavigationBarHidden(true, animated: false)
        rootViewController.navigationBar.isTranslucent = false
    }
    
    override func prepareTransition(for route: AppRoute) -> NavigationTransition {
        switch route {
        case .animatedSplashScreen:
            guard let vc = container.resolve(AnimatedSplashScreenViewController.self, argument: weakRouter) else {
                return .none()
            }

            rootViewController.setViewControllers([vc], animated: false)
            return .none()
            
        case .onboarding:
            guard let vc = container.resolve(OnboardingViewController.self, argument: weakRouter) else {
                return .none()
            }

            return .set([vc])
        case .main:
            guard let coordinator = container.resolve(MainTabBarCoordinator.self) else {
                return .none()
            }

            return .set([coordinator])
        }
    }

}

