//
// Created by Anton on 23.02.2021.
//

import RxSwift
import RxCocoa
import XCoordinator

class AddNewWordViewModel: BaseViewModel {

    private let router: WeakRouter<WordsListRouter>

    private let latestError = BehaviorSubject<Error?>(value: nil)
    private let loadedData = BehaviorSubject<WordTranslationDTO?>(value: nil)

    init(router: WeakRouter<WordsListRouter>) {
        self.router = router
    }

    func transform(input: Input) -> Output {
        let sectionModels: Driver<[TranslationsListSectionModel]> = loadedData
            .asDriverOnErrorJustComplete()
            .map { [weak self] loadedData in
                var defaultSections: [TranslationsListSectionModel] = self?.getDefaultTranslations() ?? []

                guard let translate = loadedData else  {
                    return []
                }

//                let sectionModels = [GroupsListSectionModel(identity: "MainSection", items: mappedItems)]

                return defaultSections
            }

        return Output(sectionModels: sectionModels)
    }

    private func getDefaultTranslations() -> [TranslationsListSectionModel] {
        var mainWord = TranslationsListSectionModel(
            identity: "mainWord",
            items: [
                .translation(item: TranslationDataModel(identifier: "mainWord", id: nil, originalString: nil, translationString: nil, originalAudio: nil))
            ]
        )
        mainWord.title = "Основное слово"

        var mainSentence = TranslationsListSectionModel(
            identity: "mainSentence",
            items: [
                .translation(item: TranslationDataModel(identifier: "mainSentence", id: nil, originalString: nil, translationString: nil, originalAudio: nil))
            ]
        )
        mainSentence.title = "Главный пример"

        return [
            mainWord,
            mainSentence
        ]
    }

}

extension AddNewWordViewModel {

    struct Input {
    }

    struct Output {
        let sectionModels: Driver<[TranslationsListSectionModel]>
    }

}