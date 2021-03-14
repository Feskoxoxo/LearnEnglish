//
//  DialogsListViewController.swift
//  MDAudit
//
//  Created by Semenov Anton on 14/03/2021.
//  Copyright © 2021 Mobile Dimension. All rights reserved.
//

import UIKit
import Cartography
import RxDataSources
import RxSwift

struct DialogListSectionModel {
    let id: String
    var items: [DialogListElement]
}

extension DialogListSectionModel: AnimatableSectionModelType {
    var identity: String {
        id
    }

    init(original: DialogListSectionModel, items: [DialogListElement]) {
        self = original
        self.items = items
    }
}

struct DialogListElement {
    var id: String
    var title: String?
    var imageUrl: URL?
    var lastMessage: String?
}

extension DialogListElement: IdentifiableType, Equatable {
    public var identity: String {
        return id
    }
}

final class DialogsListViewController: UIViewController {
    private let disposeBag = DisposeBag()
    private let data = BehaviorSubject<[DialogListSectionModel]>(value: [])

    private var tableView: UITableView!
    private var searchBar: UISearchBar!
    private var dataSource: RxTableViewSectionedAnimatedDataSource<DialogListSectionModel>?

    var output: DialogsListViewOutput?

    override func loadView() {
        super.loadView()

        configureViews()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        output?.viewDidLoad()
    }

    private func configureViews() {
        let searchBar = UISearchBar()

        searchBar.rx
            .text
            .debounce(.milliseconds(1500), scheduler: MainScheduler.instance)
            .subscribe(onNext: { [weak self] text in
                self?.output?.onSearchUpdate(searchString: text)
            })
            .disposed(by: disposeBag)
        self.searchBar = searchBar

        view.addSubview(searchBar)
        constrain(searchBar, view) { searchBar, view in
            searchBar.top == view.topMargin
            searchBar.leading == view.leading
            searchBar.trailing == view.trailing
            searchBar.height == 50
        }

        let tableView = UITableView()
        tableView.register(nibWithCellClass: DialogListTableViewCell.self)
        tableView.tableFooterView = UIView()
        let dataSource = RxTableViewSectionedAnimatedDataSource<DialogListSectionModel>(
            configureCell: { ds, tableView, indexPath, item in
                let cell = tableView.dequeueReusableCell(withClass: DialogListTableViewCell.self)
                cell.setup(dialog: item)
                return cell
            }
        )

        dataSource.animationConfiguration = .init(
            insertAnimation: .fade,
            reloadAnimation: .fade,
            deleteAnimation: .fade
        )

        self.dataSource = dataSource

        data.bind(to: tableView.rx.items(dataSource: dataSource)).disposed(by: disposeBag)

        self.tableView = tableView

        view.addSubview(tableView)
        constrain(tableView, view, searchBar) { tableView, view, searchBar in
            tableView.top == searchBar.bottom
            tableView.bottom == view.bottom
            tableView.leading == view.leading
            tableView.trailing == view.trailing
        }
    }
}

// MARK: DialogsListViewInput
extension DialogsListViewController: DialogsListViewInput {
    func showDialogs(dialogs: [DialogListElement]) {
        data.onNext(
            [DialogListSectionModel(id: "dialogs", items: dialogs)]
        )
    }
}
