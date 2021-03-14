//
// Created by Anton on 14.03.2021.
//

import Foundation
import PromiseKit

struct DialogsListParams {
    var page: Int
    var limit: Int
    var searchString: String?
}

protocol DialogsServiceProtocol: class {
    func loadDialogs(params: DialogsListParams) -> Promise<[DialogListElement]>
}