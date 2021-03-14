//
// Created by Anton on 14.03.2021.
//

import Foundation
import PromiseKit

class DialogServiceMock: DialogsServiceProtocol {
    func loadDialogs(params: DialogsListParams) -> Promise<[DialogListElement]> {
        Promise { seal in
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                seal.fulfill([
                    DialogListElement(id: "1", title: "Диалог 1", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "2", title: "Диалог 2", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "3", title: "Диалог 3", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "4", title: "Диалог 4", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "5", title: "Диалог 5", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "5", title: "Диалог 6", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "6", title: "Диалог 7", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "7", title: "Диалог 8", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "9", title: "Диалог 9", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                    DialogListElement(id: "10", title: "Диалог 10", imageUrl: URL(string: "https://www.interfax.ru/ftproot/photos/photostory/2019/07/09/week4_700.jpg"), lastMessage: "Сообщение номер 1"),
                ])
            }
        }
    }
}