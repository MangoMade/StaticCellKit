## About StaticCellKit

Dequeue a static cell of indexPath,

and the cell will never be reused by other indexPath.
     
## Why do I use StaticCellKit?

Sometimes we need to make a page like **Settings**. In this page, every row has different subviews. 

It's no need to create many ``UITableViewCell`` subclasses and to reuse cells.

We just need a table view with static cells and add subviews directly in view controller's implementment.

As we known, we can create a static table view in StoryBoard.

**By code, we can use this kit.**

---

当我们要开发一个类似“设置”的页面时，每一个``cell``上的子视图都不相同。

从逻辑上我们不需要重用``cell``。为每一行都创建一个``tableView``的子类又太麻烦。

这时候，如果有一个``static table view``，我们直接在view controller的实现中为cell添加子视图就方便很多。

``StoryBoard``中我们可以直接创建``static table view``。

用代码我们只需要这个kit。
     
## Usage:

``` Swift
func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell: CustomTableViewCell = tableView.sck.dequeueStaticCell(indexPath)
    
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
```
     
It will dequeue a cell which is CustomTableView type. 

You don't need to call UITableView.registerClass(_:).

``` Swift

tableView.sck.setDelegate(self)  // `self` maybe is your view controller.

extension ViewController: StaticTableViewDelegate {

	func tableView(_ tableView: UITableView, initStaticCell cell: UITableViewCell, ofIndexPath indexPath: IndexPath) {
	
	}

	func tableView(_ tableView: UITableView, initStaticHeader header: UITableViewHeaderFooterView, ofSection section: Int) {
	
	}

	func tableView(_ tableView: UITableView, initStaticFooter footer: UITableViewHeaderFooterView, ofSection section: Int) {
    
	}
   
}

```

You can use `StaticTableViewDelegate` to configure cell or header / footer.


## Requirements

* iOS 8.0
* XCode 8.0
* Swift 3.0

## Cocoapods

	pod 'StaticCellKit', '~> 0.0.2’