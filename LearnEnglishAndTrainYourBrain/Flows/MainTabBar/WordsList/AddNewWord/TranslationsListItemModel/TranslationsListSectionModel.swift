//
// Created by Anton on 27.02.2021.
//

import RxDataSources

struct TranslationsListSectionModel: AnimatableSectionModelType {

    let identity: String

    var title: String = ""
    var items: [TranslationsListItem]

}

extension TranslationsListSectionModel: SectionModelType {

    init(original: TranslationsListSectionModel, items: [TranslationsListItem]) {
        self = original
        self.items = items
    }

}
