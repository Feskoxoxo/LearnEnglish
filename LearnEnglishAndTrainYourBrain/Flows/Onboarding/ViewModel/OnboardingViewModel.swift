//
//  OnboardingViewModel.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import RxSwift
import RxCocoa
import XCoordinator

class OnboardingViewModel: BaseViewModel {
    
    private let router: WeakRouter<AppRoute>
    
    init(router: WeakRouter<AppRoute>) {
        self.router = router
    }
    
    func transform(input: Input) -> Output {
        input.next
            .drive(
                onNext: { [weak self] in
                    self?.router.trigger(.main)
                }
            )
            .disposed(by: disposeBag)
        
        return Output()
    }
    
}

extension OnboardingViewModel {
    
    struct Input {
        let next: Driver<Void>
    }
    
    struct Output {
    }
    
}
