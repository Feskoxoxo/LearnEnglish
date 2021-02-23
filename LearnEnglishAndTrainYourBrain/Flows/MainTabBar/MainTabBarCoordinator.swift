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
import Swinject

enum MainTabBarRoute: Route {}

class MainTabBarCoordinator: TabBarCoordinator<MainTabBarRoute> {

    private var container: Swinject.Container

    init(container: Swinject.Container) {
        self.container = container

        var tabs: [Presentable] = []

        if let tab = container.resolve(RepeatCoordinator.self) {
            tab.rootViewController.tabBarItem = UITabBarItem(
                title: "Повторение",
                image: UIImage(named: "RepeatImage"),
                selectedImage: UIImage(named: "RepeatImage")
            )

            tabs.append(tab.strongRouter)
        }

        if let tab = container.resolve(WordsListCoordinator.self) {
            tab.rootViewController.tabBarItem = UITabBarItem(
                title: "Список повторения",
                image: UIImage(named: "RepeatImage"),
                selectedImage: UIImage(named: "RepeatImage")
            )

            tabs.append(tab.strongRouter)
        }

        if let tab = container.resolve(StatisticsCoordinator.self) {
            tab.rootViewController.tabBarItem = UITabBarItem(
                title: "Статистика",
                image: UIImage(named: "RepeatImage"),
                selectedImage: UIImage(named: "RepeatImage")
            )

            tabs.append(tab.strongRouter)
        }

        if let tab = container.resolve(SettingsCoordinator.self) {
            tab.rootViewController.tabBarItem = UITabBarItem(
                title: "Настройки",
                image: UIImage(named: "RepeatImage"),
                selectedImage: UIImage(named: "RepeatImage")
            )

            tabs.append(tab.strongRouter)
        }


        super.init(
            rootViewController: MainTabBarController(),
            tabs: tabs,
            select: 0
        )
    }
}
