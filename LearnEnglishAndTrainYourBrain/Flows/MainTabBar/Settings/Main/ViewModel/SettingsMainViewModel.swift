//
// Created by Anton on 23.02.2021.
//

import RxSwift
import RxCocoa
import XCoordinator

class SettingsMainViewModel: BaseViewModel {

    private let router: WeakRouter<SettingsRouter>

    init(router: WeakRouter<SettingsRouter>) {
        self.router = router
    }

    func transform(input: Input) -> Output {

        return Output()
    }

}

extension SettingsMainViewModel {

    struct Input {
    }

    struct Output {
    }

}