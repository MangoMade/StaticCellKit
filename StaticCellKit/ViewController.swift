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
    
    fileprivate let cellSwitch = UISwitch()
    
    fileprivate let footerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("button", for: .normal)
        return button
    }()
    
    fileprivate let progressView = UIProgressView(progressViewStyle: .default)
    
    fileprivate let slider = UISlider()
    
    fileprivate let label: UILabel = {
        let label = UILabel()
        label.text = "label"
        label.textColor = UIColor.black
        return label
    }()
    
    fileprivate let textField = UITextField()
    
    fileprivate struct Const {
        static let paddingRight: CGFloat = 15.0
        static let paddingTop: CGFloat = 10.0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.allowsSelection = false
        tableView.frame         = view.bounds
        tableView.keyboardDismissMode = .onDrag
        tableView.dataSource    = self
        tableView.delegate      = self
        tableView.sck.setDelegate(self)
    }

}


extension ViewController: StaticTableViewDelegate {
    
    func tableView(_ tableView: UITableView, initStaticCell cell: UITableViewCell, ofIndexPath indexPath: IndexPath) {
        guard indexPath.section == 0 else { return }
        switch indexPath.row {
        case 0:
            cell.contentView.addSubview(cellSwitch)
            let height = Scale.height(height: 30)
            let width = Scale.width(width: 50)
            cellSwitch.frame = CGRect(x: Screen.width - width - Const.paddingRight,
                                      y: Const.paddingTop,
                                      width: width,
                                      height: height)
        case 1:
            progressView.progress = 0.5
            cell.contentView.addSubview(progressView)
            let height = Scale.height(height: 30)
            let width = Scale.width(width: 200)
            progressView.frame = CGRect(x: Screen.width - width - Const.paddingRight,
                                        y: Const.paddingTop,
                                        width: width,
                                        height: height)
        case 2:
            textField.placeholder = "placeholder"
            cell.contentView.addSubview(textField)
            let height = Scale.height(height: 30)
            let width = Scale.width(width: 200)
            textField.frame = CGRect(x: Screen.width - width - Const.paddingRight,
                                      y: Const.paddingTop,
                                      width: width,
                                      height: height)
        case 3:
            cell.contentView.addSubview(slider)
            let height = Scale.height(height: 30)
            let width = Scale.width(width: 200)
            slider.frame = CGRect(x: Screen.width - width - Const.paddingRight,
                                     y: Const.paddingTop,
                                     width: width,
                                     height: height)
        default:
            break
        }
    }
    
    func tableView(_ tableView: UITableView, initStaticHeader header: UITableViewHeaderFooterView, ofSection section: Int) {
        guard section == 0 else { return }
        header.contentView.addSubview(label)
        let height = Scale.height(height: 30)
        let width = Scale.width(width: 50)
        label.frame = CGRect(x: Screen.width - width - Const.paddingRight,
                             y: Const.paddingTop,
                             width: width,
                             height: height)
    }
    
    func tableView(_ tableView: UITableView, initStaticFooter footer: UITableViewHeaderFooterView, ofSection section: Int) {
        guard section == 0 else { return }
        footer.contentView.addSubview(footerButton)
        let height = Scale.height(height: 30)
        let width = Scale.width(width: 50)
        footerButton.frame = CGRect(x: Screen.width - width - Const.paddingRight,
                                    y: Const.paddingTop,
                                    width: width,
                                    height: height)
    }
    
}

extension ViewController: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return section == 0 ? 4 : 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.sck.dequeueStaticCell(indexPath)
        cell.textLabel?.text = "\(indexPath.section) section \(indexPath.row) row"
        return cell
    }

    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let header = tableView.sck.dequeueStaticHeaderView(section)
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard section == 0 else { return nil }
        let footer = tableView.sck.dequeueStaticFooterView(section)
        return footer
    }
}

extension ViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
}
