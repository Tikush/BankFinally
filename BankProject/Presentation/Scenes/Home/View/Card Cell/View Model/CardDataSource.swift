//
//  CardDataSourse.swift
//  BankProject
//
//  Created by Tiko Janikashvili on 18.01.23.
//

import UIKit

class CardDataSource: NSObject, UITableViewDataSource {
    
    // MARK: - Private Properties
    
    private var tableView: UITableView!
    private var cardData: [Card]
    
    init(tableView: UITableView, cardData: [Card]) {
        
        self.tableView = tableView
        self.tableView.registerNib(class: CardItemCell.self)
        self.cardData = cardData
        
        super.init()
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        cardData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.deque(CardItemCell.self, for: indexPath)
        cell.configure(with: cardData[indexPath.row])
        return cell
    }
}

extension CardDataSource: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        60
    }
}
