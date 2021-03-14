//
//  DialogsListPresenter.swift
//  MDAudit
//
//  Created by Semenov Anton on 14/03/2021.
//  Copyright © 2021 Mobile Dimension. All rights reserved.
//

import Foundation

final class DialogsListPresenter {
    typealias View = DialogsListViewInput
    typealias Interactor = DialogsListInteractorInput
    typealias Router = DialogsListRouterInput
    typealias Output = DialogsListModuleOutput

    weak var view: View?
    weak var output: Output?
    var interactor: Interactor?
    var router: Router?

    private var currentPage: Int = 0
    private var searchString: String? = ""
    private var allLoadedItems: [DialogListElement] = []
}

// MARK: DialogsListContentViewOutput
extension DialogsListPresenter: DialogsListViewOutput {
    func viewDidLoad() {
        interactor?.loadDialogs(page: currentPage, searchString: searchString)
    }

    func onSearchUpdate(searchString: String?) {
        guard self.searchString != searchString else {
            return
        }

        self.searchString = searchString
        allLoadedItems = []
        currentPage = 0

        interactor?.loadDialogs(page: currentPage, searchString: searchString)
    }

    func loadNextPage() {
        currentPage += 1
        interactor?.loadDialogs(page: currentPage, searchString: searchString)
    }
}

// MARK: DialogsListInteractorOutput
extension DialogsListPresenter: DialogsListInteractorOutput {
    func dialogsDidLoad(dialogs: [DialogListElement]) {
        allLoadedItems += dialogs
        view?.showDialogs(dialogs: allLoadedItems)
    }

    func onError() {
        //TODO: 
    }
}

// MARK: DialogsListModuleInput
extension DialogsListPresenter: DialogsListModuleInput {

}
