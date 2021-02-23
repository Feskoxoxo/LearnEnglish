//
//  MainTabBarCoordinator.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit
import XCoordinator
import RxSwift
import RxCocoa

enum MainTabBarRoute: Route {}

class MainTabBarCoordinator: TabBarCoordinator<MainTabBarRoute> {
    init() {
        let achivmentsCoordinator = AchivmentsCoordinator()
        super.init(
            rootViewController: MainTabBarController(),
            tabs: [achivmentsCoordinator.strongRouter],
            select: achivmentsCoordinator
        )
    }
}
