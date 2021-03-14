//
//  DialogsListInteractorOutput.swift
//  MDAudit
//
//  Created by Semenov Anton on 14/03/2021.
//  Copyright © 2021 Mobile Dimension. All rights reserved.
//

import Foundation

protocol DialogsListInteractorOutput: class {
    func dialogsDidLoad(dialogs: [DialogListElement])
    func onError()
}