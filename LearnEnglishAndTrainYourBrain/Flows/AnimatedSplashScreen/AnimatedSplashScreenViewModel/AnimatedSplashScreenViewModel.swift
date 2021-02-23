//
// Created by Anton on 14.02.2021.
//

import Foundation
import RxSwift
import RxCocoa
import XCoordinator

class AnimatedSplashScreenViewModel: BaseViewModel {
    private let router: WeakRouter<AppRoute>

    init(router: WeakRouter<AppRoute>) {
        self.router = router
    }

    func transform(input: Input) -> Output {
        input.next
            .drive(
                onNext: { [weak self] value in
                    guard value else {
                        return
                    }
                    self?.router.trigger(.onboarding)
                }
            )
            .disposed(by: disposeBag)

        return Output()
    }
}

extension AnimatedSplashScreenViewModel {

    struct Input {
        let next: Driver<Bool>
    }

    struct Output {
    }

}