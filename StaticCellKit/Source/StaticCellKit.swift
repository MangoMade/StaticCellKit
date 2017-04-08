//
//  StaticCellKit.swift
//  StaticCellKit
//
//  Created by Mango on 2016/11/10.
//  Copyright © 2016年 MangoMade. All rights reserved.
//

import UIKit

@objc public protocol StaticTableViewDelegate {
    
    /// those methods will be invoked only once when static views did init.
    
    @objc optional func tableView(_ tableView: UITableView, initStaticCell cell: UITableViewCell, ofIndexPath indexPath: IndexPath)
    
    @objc optional func tableView(_ tableView: UITableView, initStaticHeader header: UITableViewHeaderFooterView, ofSection section: Int)
    
    @objc optional func tableView(_ tableView: UITableView, initStaticFooter footer: UITableViewHeaderFooterView, ofSection section: Int)
    
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
     let cell: CustomTableViewCell = tableView.sck.dequeueStaticCell(indexPath)
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
            self.delegate?.tableView?(self.tableView, initStaticCell: cell, ofIndexPath: indexPath)
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
            if isHeader {
                self.delegate?.tableView?(self.tableView, initStaticHeader: header, ofSection: section)
            } else {
                self.delegate?.tableView?(self.tableView, initStaticFooter: header, ofSection: section)
            }
            return header
        }
    }
    
    /// this is a weak delegate
    
    public weak var delegate: StaticTableViewDelegate? {
        get {
            return delegateWrapper.instance
        }
        set {
            delegateWrapper.instance = newValue
        }
    }
    
    private var delegateWrapper: WeakReferenceWrapper<StaticTableViewDelegate> {
        var wrapper = objc_getAssociatedObject(self.tableView, &delegateWrapperKey) as? WeakReferenceWrapper<StaticTableViewDelegate>
        if wrapper == nil {
            wrapper = WeakReferenceWrapper<StaticTableViewDelegate>()
            objc_setAssociatedObject(self.tableView, &delegateWrapperKey, wrapper, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
        return wrapper!
    }
}

private var delegateWrapperKey = 0

