//
//  UITableView+StaticCellKit.swift
//  StaticCellKit
//
//  Created by Mango on 2016/11/10.
//  Copyright © 2016年 MangoMade. All rights reserved.
//

import UIKit

@objc protocol StaticTableViewDelegate {
    @objc optional func tableView(_ tableView: UITableView, initStaticCell cell: UITableViewCell, ofIndexPath indexPath: NSIndexPath)
}

extension UITableView: NamespaceWrappable { }

private extension TypeWrapper {
    
    var tableView: T {
        return wrapperObject
    }
    
}

public extension TypeWrapper where T: UITableView {
    
    /**
     Dequeue a static cell of indexPath,
     and the cell will never be reused by other indexPath.
     
     ### Usage:
     
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
     let cell: CustomTableViewCell = tableView.dequeueStaticCell(indexPath)
     return cell
     }
     
     It will dequeue a cell which is CustomTableView type.
     You don't need to call UITableView.registerClass(_:).
     */
    
    public func dequeueStaticCell<T: UITableViewCell>(_ indexPath: IndexPath) -> T {
        let reuseIdentifier = "\(T.description()) - section\(indexPath.section) - row:\(indexPath.row)"
        if let cell = self.tableView.dequeueReusableCell(withIdentifier: reuseIdentifier) as? T {
            return cell
        } else {
            let cell = T(style: .default, reuseIdentifier: reuseIdentifier)
            return cell
        }
    }
    
    public func dequeueStaticHeaderView<T: UITableViewHeaderFooterView>(_ section: Int) -> T {
        let header: T = dequeueStaticHeaderFooterView(section, isHeader: true)
        return header
    }
    
    public func dequeueStaticFooterView<T: UITableViewHeaderFooterView>(_ section: Int) -> T {
        let footer: T = dequeueStaticHeaderFooterView(section, isHeader: false)
        return footer
    }
    
    private func dequeueStaticHeaderFooterView<T: UITableViewHeaderFooterView>(_ section: Int, isHeader: Bool) -> T {
        let reuseIdentifier = "\(T.description()) - \(isHeader ? "Header" : "Footer") - section:\(section)"
        if let header = self.tableView.dequeueReusableHeaderFooterView(withIdentifier: reuseIdentifier) as? T {
            return header
        } else {
            let header = T(reuseIdentifier: reuseIdentifier)
            return header
        }
    }
    
}

