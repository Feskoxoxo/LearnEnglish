//
//  AddNewWordViewController.swift
//  LearnEnglishAndTrainYourBrain
//
//  Created by Anton on 23.02.2021.
//

import UIKit
import RxDataSources
import SwifterSwift
import RxSwift

class AddNewWordViewController: BaseViewController {

    @IBOutlet private weak var mainTableView: UITableView!
    @IBOutlet private weak var saveButton: MainStyleButton!

    private var dataSource: RxTableViewSectionedAnimatedDataSource<TranslationsListSectionModel>?

    private let disposeBag = DisposeBag()
    private let viewModel: AddNewWordViewModel

    init(viewModel: AddNewWordViewModel) {
        self.viewModel = viewModel

        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        configureTableView()
        configureStyle()
        bind()
    }

    private func configureTableView() {
        mainTableView.register(nibWithCellClass: NewTranslationTableViewCell.self)

        let dataSource = RxTableViewSectionedAnimatedDataSource<TranslationsListSectionModel>(
            configureCell: { _, collectionView, indexPath, item in
                switch item {
                case let .translation(item: translation):
                    let cell = collectionView.dequeueReusableCell(withClass: NewTranslationTableViewCell.self, for: indexPath)
                    return cell
                case .addNewExampleButton:
                    let cell = collectionView.dequeueReusableCell(withClass: NewTranslationTableViewCell.self, for: indexPath)
                    return cell
                }
            }
        )

        mainTableView.rx
            .setDelegate(self)
            .disposed(by: disposeBag)

        self.dataSource = dataSource
    }

    private func bind() {
        let input = AddNewWordViewModel.Input(
        )

        let output = viewModel.transform(input: input)

        // MARK: Привязка данных к таблице

        output.sectionModels
            .drive(mainTableView.rx.items(dataSource: dataSource!))
            .disposed(by: disposeBag)
    }

    private func configureStyle() {
        saveButton.setTitle("Сохранить", for: .normal)
    }

}


// MARK: UITableViewDelegate
extension AddNewWordViewController: UITableViewDelegate {

}
