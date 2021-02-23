//
// Created by Anton on 23.02.2021.
//

import RxSwift
import RxCocoa
import XCoordinator

class RepeatMainViewModel: BaseViewModel {

    private let router: WeakRouter<RepeatRouter>

    init(router: WeakRouter<RepeatRouter>) {
        self.router = router
    }

    func transform(input: Input) -> Output {
        input.next
            .drive(
                onNext: { [weak self] in

                }
            )
            .disposed(by: disposeBag)

        return Output()
    }

}

extension RepeatMainViewModel {

    struct Input {
        let next: Driver<Void>
    }

    struct Output {
    }

}