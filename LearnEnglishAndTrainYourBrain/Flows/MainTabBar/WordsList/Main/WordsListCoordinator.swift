//
// Created by Anton on 23.02.2021.
//


import XCoordinator
import RxSwift
import RxCocoa
import Swinject

enum WordsListRouter: Route {

    case main
    case back
    case dismiss

}

class WordsListCoordinator: NavigationCoordinator<WordsListRouter> {

    private var container: Swinject.Container

    init(container: Swinject.Container) {
        self.container = container
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)

        rootViewController.navigationBar.isTranslucent = false
        rootViewController.setNavigationBarHidden(true, animated: false)
    }

    // MARK: Overrides
    override func prepareTransition(for route: WordsListRouter) -> NavigationTransition {
        switch route {
        case .main:
            guard let vc = container.resolve(AddNewWordViewController.self, argument: weakRouter) else {
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