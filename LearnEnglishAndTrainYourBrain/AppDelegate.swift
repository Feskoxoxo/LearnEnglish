//
//  AppDelegate.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit
import Swinject
import XCoordinator

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    private lazy var mainWindow = UIWindow()
    
    private let container = Container() { container in
        container.register(AppCoordinator.self) { _ in
            AppCoordinator(container: container)
        }

        container.register(AnimatedSplashScreenViewModel.self) { _, router in
            AnimatedSplashScreenViewModel(router: router)
        }

        container.register(AnimatedSplashScreenViewController.self) { (resolver, router: WeakRouter<AppRoute>) in
            AnimatedSplashScreenViewController(viewModel: resolver.resolve(AnimatedSplashScreenViewModel.self, argument: router)!)
        }

        container.register(OnboardingViewModel.self) { _, router in
            OnboardingViewModel(router: router)
        }

        container.register(OnboardingViewController.self) { (resolver, router: WeakRouter<AppRoute>) in
            OnboardingViewController(viewModel: resolver.resolve(OnboardingViewModel.self, argument: router)!)
        }
    }

    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = container.resolve(AppCoordinator.self)
        appCoordinator?.setRoot(for: mainWindow)
        
        return true
    }

}

