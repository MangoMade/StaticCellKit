//
//  UITableView+StaticCellKit.swift
//  StaticCellKit
//
//  Created by Mango on 2016/11/10.
//  Copyright © 2016年 MangoMade. All rights reserved.
//

import UIKit

// MARK: - Static Table View
extension UITableView {
    /**
     Dequeue a static cell of indexPath, 
     and the cell will never be reused by other indexPath.
     
     ###Usage:
     
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueStaticCell(indexPath)
        return cell
     }
     
     It will dequeue a cell which is CustomTableView type.
     You don't need to call UITableView.registerClass(_:).
     */
    
    func dequeueStaticCell<T: UITableViewCell>(indexPath: NSIndexPath) -> T {
        let reuseIdentifier = "\(T.description()) - \(indexPath.description)"
        if let cell = self.dequeueReusableCellWithIdentifier(reuseIdentifier) as? T {
            return cell
        } else {
            let cell = T(style: .Default, reuseIdentifier: reuseIdentifier)
            return cell
        }
    }
    
    func dequeueStaticHeaderView<T: UITableViewHeaderFooterView>(section: Int) -> T {
        let header: T = dequeueStaticHeaderFooterView(section, isHeader: true)
        return header
    }
    
    func dequeueStaticFooterView<T: UITableViewHeaderFooterView>(section: Int) -> T {
        let footer: T = dequeueStaticHeaderFooterView(section, isHeader: false)
        return footer
    }
    
    
    
    private func dequeueStaticHeaderFooterView<T: UITableViewHeaderFooterView>(section: Int, isHeader: Bool) -> T {
        let reuseIdentifier = "\(T.description()) - \(isHeader ? "Header" : "Footer") - section:\(section)"
        if let header = self.dequeueReusableHeaderFooterViewWithIdentifier(reuseIdentifier) as? T {
            return header
        } else {
            let header = T(reuseIdentifier: reuseIdentifier)
            return header
        }
    }
    
}
