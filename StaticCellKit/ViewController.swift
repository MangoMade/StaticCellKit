//
//  ViewController.swift
//  StaticCellKit
//
//  Created by Mango on 2016/11/10.
//  Copyright © 2016年 MangoMade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    fileprivate let tableView = UITableView(frame: .zero, style: .grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.dataSource    = self
        tableView.delegate      = self
        
    }

}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.sck.dequeueStaticCell(indexPath)
        cell.textLabel?.text = "\(indexPath.section) section \(indexPath.row) row"
        if indexPath.row == 1 {
            cell.contentView.backgroundColor = UIColor.lightGray
        }
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .leastNormalMagnitude
    }
}
