//
// Created by Anton on 23.02.2021.
//

import XCoordinator
import RxSwift
import RxCocoa
import Swinject

enum RepeatRouter: Route {

    case main
    case back
    case dismiss

}

class RepeatCoordinator: NavigationCoordinator<RepeatRouter> {

    private var container: Swinject.Container

    init(container: Swinject.Container) {
        self.container = container
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)

        rootViewController.navigationBar.isTranslucent = false
        rootViewController.setNavigationBarHidden(true, animated: false)
    }

    // MARK: Overrides
    override func prepareTransition(for route: RepeatRouter) -> NavigationTransition {
        switch route {
        case .main:
            guard let vc = container.resolve(RepeatMainViewController.self, argument: weakRouter) else {
                return .none()
            }
            return .set([vc])

        case .back:
            return .pop()

        case .dismiss:
            return .dismiss()
        }
    }

}
