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
        tableView.delegate = self
//        tableView.allowsSelection = false
        tableView.register(cellType: StatusLineOfficialCell.self)
        tableView.register(cellType: StatusCompanyCell.self)
    }
    
}

// MARK: - UITableViewDataSource
extension StatusLineOfficialViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: UITableViewCell
        let item = items[indexPath.row]
        
        if item.statusCellType == .companyCell {
            let statusCompanyCell: StatusCompanyCell = tableView.dequeueReusableCell(for: indexPath)
            statusCompanyCell.setup(line: items[indexPath.row])
            cell = statusCompanyCell
        } else {
            let statusLineOfficialCell: StatusLineOfficialCell = tableView.dequeueReusableCell(for: indexPath)
            statusLineOfficialCell.setup(line: items[indexPath.row])
            statusLineOfficialCell.setDelegate(delegate: self)
            cell = statusLineOfficialCell
        }
        
        return cell
    }

}

// MARK: - UITableViewDelegate
extension StatusLineOfficialViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        if indexPathIsSelected(indexPath, on: tableView) {
            let cell: StatusLineOfficialCell = tableView.dequeueReusableCell(for: indexPath)
//            cell.animateStatusDescription(selected: false)
            tableView.deselectRow(at: indexPath, animated: true)
            tableView.beginUpdates()
            tableView.endUpdates()
            return nil
        }
        
        return indexPath
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let item = items[indexPath.row]

        if item.statusCellType == .lineCell {
            let cell: StatusLineOfficialCell = tableView.dequeueReusableCell(for: indexPath)
//            cell.animateStatusDescription(selected: true)
            tableView.beginUpdates()
            tableView.endUpdates()
        }
    }
    
    private func indexPathIsSelected(_ indexPath: IndexPath, on tableView: UITableView) -> Bool {
        guard let selectedIndexPath = tableView.indexPathForSelectedRow else {
            return false
        }
        
        return selectedIndexPath == indexPath
    }
}

extension StatusLineOfficialViewController: StatusLineOfficialViewProtocol {
    
    func showStatusLines(lines: [Line]) {
        items.removeAll()
        items.append(contentsOf: lines)
        tableView.reloadData()
    }
    
}

extension StatusLineOfficialViewController: StatusLineOfficialCellDelegate {
    func arrowTapped(cell: StatusLineOfficialCell) {
        
        cell.animateStatusDescription(selected: true)
        tableView.beginUpdates()
        tableView.endUpdates()
    }
}
