//
//  AchivmentsMainViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 06.02.2021.
//

import UIKit
import RxSwift
import RxCocoa

class StatisticsMainViewController: BaseViewController {

    private let viewModel: StatisticsMainViewModel

    init(viewModel: StatisticsMainViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureStyle()
        bind()
    }

    private func bind() {
        let input = StatisticsMainViewModel.Input()

        _ = viewModel.transform(input: input)
    }

    private func configureStyle() {
//        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .medium)
    }

}
