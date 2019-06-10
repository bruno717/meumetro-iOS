//
//  StatusLineOfficialViewController.swift
//  MeuMetro
//
//  Created by Bruno Oliveira on 27/05/19.
//  Copyright © 2019 meu metro. All rights reserved.
//

import UIKit

class StatusLineOfficialViewController: UIViewController  {

    @IBOutlet weak var tableView: UITableView!
    
    private var items: [Line] = []
    
    var presenter: StatusLineOfficialPresenterProtocol!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.loadStatusLinesOfficial()
    }

    private func setupTableView() {
        tableView.estimatedRowHeight = 100
        tableView.rowHeight = UITableView.automaticDimension
        tableView.contentInset.bottom = 16
        tableView.dataSource = self
        tableView.register(cellType: StatusLineOfficialCell.self)
    }
    
}

// MARK: - UITableViewDataSource
extension StatusLineOfficialViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: StatusLineOfficialCell = tableView.dequeueReusableCell(for: indexPath)
        cell.setup(line: items[indexPath.row])
        return cell
    }
}

extension StatusLineOfficialViewController: StatusLineOfficialViewProtocol {
    
    func showStatusLines(lines: [Line]) {
        items.removeAll()
        items.append(contentsOf: lines)
        tableView.reloadData()
    }
    
}
