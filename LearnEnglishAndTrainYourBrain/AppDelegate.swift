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
        container.register(RepeatCoordinator.self) { _ in
            RepeatCoordinator(container: container)
        }
        container.register(SettingsCoordinator.self) { _ in
            SettingsCoordinator(container: container)
        }
        container.register(StatisticsCoordinator.self) { _ in
            StatisticsCoordinator(container: container)
        }
        container.register(WordsListCoordinator.self) { _ in
            WordsListCoordinator(container: container)
        }
        container.register(MainTabBarCoordinator.self) { _ in
            MainTabBarCoordinator(container: container)
        }

        // MARK: AnimatedSplashScreen
        container.register(AnimatedSplashScreenViewModel.self) { _, router in
            AnimatedSplashScreenViewModel(router: router)
        }
        container.register(AnimatedSplashScreenViewController.self) { (resolver, router: WeakRouter<AppRoute>) in
            AnimatedSplashScreenViewController(viewModel: resolver.resolve(AnimatedSplashScreenViewModel.self, argument: router)!)
        }

        // MARK: Onboarding
        container.register(OnboardingViewModel.self) { _, router in
            OnboardingViewModel(router: router)
        }
        container.register(OnboardingViewController.self) { (resolver, router: WeakRouter<AppRoute>) in
            OnboardingViewController(viewModel: resolver.resolve(OnboardingViewModel.self, argument: router)!)
        }

        // MARK: Settings
        container.register(SettingsMainViewModel.self) { _, router in
            SettingsMainViewModel(router: router)
        }
        container.register(SettingsMainViewController.self) { (resolver, router: WeakRouter<AppRoute>) in
            SettingsMainViewController(viewModel: resolver.resolve(SettingsMainViewModel.self, argument: router)!)
        }

        // MARK: WordsList
        container.register(WordsListMainViewModel.self) { _, router in
            WordsListMainViewModel(router: router)
        }
        container.register(WordsListMainViewController.self) { (resolver, router: WeakRouter<WordsListRouter>) in
            WordsListMainViewController(viewModel: resolver.resolve(WordsListMainViewModel.self, argument: router)!)
        }

        // MARK: Repeat
        container.register(RepeatMainViewModel.self) { _, router in
            RepeatMainViewModel(router: router)
        }
        container.register(RepeatMainViewController.self) { (resolver, router: WeakRouter<RepeatRouter>) in
            RepeatMainViewController(viewModel: resolver.resolve(RepeatMainViewModel.self, argument: router)!)
        }

        // MARK: Statistics
        container.register(StatisticsMainViewModel.self) { _, router in
            StatisticsMainViewModel(router: router)
        }
        container.register(StatisticsMainViewController.self) { (resolver, router: WeakRouter<AppRoute>) in
            StatisticsMainViewController(viewModel: resolver.resolve(StatisticsMainViewModel.self, argument: router)!)
        }

        // MARK: AddNewWord
        container.register(AddNewWordViewModel.self) { _, router in
            AddNewWordViewModel(router: router)
        }
        container.register(AddNewWordViewController.self) { (resolver, router: WeakRouter<WordsListRouter>) in
            AddNewWordViewController(viewModel: resolver.resolve(AddNewWordViewModel.self, argument: router)!)
        }
    }

    private var appCoordinator: AppCoordinator?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        appCoordinator = container.resolve(AppCoordinator.self)
        appCoordinator?.setRoot(for: mainWindow)
        
        return true
    }

}

