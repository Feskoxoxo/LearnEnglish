//
//  AchivmentsMainViewModel.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//


import RxSwift
import RxCocoa
import XCoordinator

class StatisticsMainViewModel: BaseViewModel {

    private let router: WeakRouter<StatisticsRouter>

    init(router: WeakRouter<StatisticsRouter>) {
        self.router = router
    }

    func transform(input: Input) -> Output {
        return Output()
    }

}

extension StatisticsMainViewModel {

    struct Input {
    }

    struct Output {
    }

}
