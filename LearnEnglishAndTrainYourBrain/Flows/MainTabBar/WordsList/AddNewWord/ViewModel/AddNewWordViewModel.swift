//
// Created by Anton on 23.02.2021.
//

import RxSwift
import RxCocoa
import XCoordinator

class AddNewWordViewModel: BaseViewModel {

    private let router: WeakRouter<WordsListRouter>

    init(router: WeakRouter<WordsListRouter>) {
        self.router = router
    }

    func transform(input: Input) -> Output {

        return Output()
    }

}

extension AddNewWordViewModel {

    struct Input {
    }

    struct Output {
    }

}