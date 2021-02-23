//
// Created by Anton on 23.02.2021.
//

import XCoordinator
import RxSwift
import RxCocoa
import Swinject

enum SettingsRouter: Route {

    case main
    case back
    case dismiss

}

class SettingsCoordinator: NavigationCoordinator<SettingsRouter> {

    private var container: Swinject.Container

    init(container: Swinject.Container) {
        self.container = container
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)

        rootViewController.navigationBar.isTranslucent = false
        rootViewController.setNavigationBarHidden(true, animated: false)
    }

    // MARK: Overrides
    override func prepareTransition(for route: SettingsRouter) -> NavigationTransition {
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