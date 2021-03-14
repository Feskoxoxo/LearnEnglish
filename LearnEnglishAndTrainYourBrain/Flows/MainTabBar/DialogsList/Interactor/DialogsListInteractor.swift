//
//  DialogsListInteractor.swift
//  MDAudit
//
//  Created by Semenov Anton on 14/03/2021.
//  Copyright © 2021 Mobile Dimension. All rights reserved.
//

import Foundation

final class DialogsListInteractor {

    private var dialogService: DialogsServiceProtocol

    weak var output: DialogsListInteractorOutput?

    init(dialogService: DialogsServiceProtocol) {
        self.dialogService = dialogService
    }

}

// MARK: DialogsListInteractorInput
extension DialogsListInteractor: DialogsListInteractorInput {
    func loadDialogs(page: Int, searchString: String?) {
        dialogService.loadDialogs(params: DialogsListParams(page: page, limit: 10, searchString: searchString)).done { [weak self] elements in
            self?.output?.dialogsDidLoad(dialogs: elements)
        }.catch { [weak self] error in
            self?.output?.onError()
        }
    }
}