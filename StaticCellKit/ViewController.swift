//
//  ViewController.swift
//  StaticCellKit
//
//  Created by Mango on 2016/11/10.
//  Copyright © 2016年 MangoMade. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    private let tableView = UITableView(frame: .zero, style: .Grouped)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame         = view.bounds
        tableView.dataSource    = self
        tableView.delegate      = self
    }

}

extension ViewController: UITableViewDataSource{
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueStaticCell(indexPath)
        cell.textLabel?.text = "\(indexPath.section) section \(indexPath.row) row"
        if indexPath.row == 1 {
            cell.contentView.backgroundColor = UIColor.lightGrayColor()
        }
        return cell
    }

}

extension ViewController: UITableViewDelegate {
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .min
    }
}
