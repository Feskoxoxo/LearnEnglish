//
// Created by Anton on 27.02.2021.
//

import RxDataSources

enum TranslationsListItem: IdentifiableType, Equatable {

    case translation(item: TranslationDataModel)
    case addNewExampleButton

}

extension TranslationsListItem {

    var identity: String {
        switch self {
        case let .translation(item): return item.identifier
        case .addNewExampleButton: return "addNewExampleButton"
        }
    }

}