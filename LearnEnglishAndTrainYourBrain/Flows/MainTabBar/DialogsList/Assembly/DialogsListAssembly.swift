//
//  DialogsListAssembly.swift
//  MDAudit
//
//  Created by Semenov Anton on 14/03/2021.
//  Copyright © 2021 Mobile Dimension. All rights reserved.
//

import Foundation

typealias DialogsListModule = BaseModule<DialogsListModuleInput, DialogsListModuleOutput>

//class Assembly {
//    static func createModule(_ module: DialogsListModule.Type, output: DialogsListModuleOutput?) -> DialogsListModule? {
//        let controller = DialogsListViewController()
//        let presenter = DialogsListPresenter()
//        let interactor = DialogsListInteractor()
//        let router = DialogsListRouter()
//
//        presenter.view = controller
//        controller.output = presenter
//        router.transitionHandler = controller
//        presenter.interactor = interactor
//        interactor.output = presenter
//        presenter.router = router
//        presenter.output = output
//
//        return DialogsListModule(view: controller, input: presenter, output: output)
//    }
//}
