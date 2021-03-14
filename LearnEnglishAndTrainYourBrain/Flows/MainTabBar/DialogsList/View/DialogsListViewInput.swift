//
//  DialogsListViewInput.swift
//  MDAudit
//
//  Created by Semenov Anton on 14/03/2021.
//  Copyright © 2021 Mobile Dimension. All rights reserved.
//

import Foundation

protocol DialogsListViewInput: View {
    func showDialogs(dialogs: [DialogListElement])
}