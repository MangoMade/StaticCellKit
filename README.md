# StaticCellKit

Dequeue a static cell of indexPath,  
and the cell will never be reused by other indexPath.
     
###Usage:
     
     func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell: CustomTableViewCell = tableView.dequeueStaticCell(indexPath)
        return cell
     }
     
It will dequeue a cell which is CustomTableView type. 
You don't need to call UITableView.registerClass(_:).