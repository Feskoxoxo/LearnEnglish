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

enum DialogsListCoordinatorRouter: Route {

    case main
    case back
    case dismiss

}

class DialogsListRouterCoordinator: NavigationCoordinator<DialogsListCoordinatorRouter> {

    private var container: Swinject.Container

    init(container: Swinject.Container) {
        self.container = container
        super.init(rootViewController: BaseNavigationController(), initialRoute: .main)

        rootViewController.setNavigationBarHidden(false, animated: false)
    }

    // MARK: Overrides
    override func prepareTransition(for route: DialogsListCoordinatorRouter) -> NavigationTransition {
        switch route {
        case .main:
            guard let vc = container.resolve(DialogsListModule.self) else {
                return .none()
            }

            return .set([vc.view])

        case .back:
            return .pop()

        case .dismiss:
            return .dismiss()
        }
    }

}