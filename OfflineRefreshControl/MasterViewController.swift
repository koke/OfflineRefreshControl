//
//  MasterViewController.swift
//  OfflineRefreshControl
//
//  Created by Jorge Bernal Ordovas on 04/01/16.
//  Copyright © 2016 WordPress. All rights reserved.
//

import UIKit

class MasterViewController: UITableViewController {
    
    @IBAction func refresh(sender: CustomRefreshControl) {
        delay(3) { [weak self] in
            self?.refreshControl?.endRefreshing()
        }
    }

    // MARK: - Table View

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 2
        } else {
            return 100
        }
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)

        if indexPath.section == 0 {
            if indexPath.row == 0 {
                cell.textLabel!.text = "Set message"
            } else {
                cell.textLabel!.text = "Clear message"
            }
        } else {
            cell.textLabel!.text = "Sample cell"
        }
        return cell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        guard indexPath.section == 0 else { return }
        let refresh = refreshControl as! CustomRefreshControl
        delay(0.1) {
            if indexPath.row == 0 {
                refresh.message = "You are offline"
                let contentOffset = CGPoint(x: 0, y: -tableView.contentInset.top)
                tableView.setContentOffset(contentOffset, animated: true)
            } else {
                refresh.message = nil
            }
        }
    }
}

func delay(delay:Double, closure: Void -> ()) {
    dispatch_after(
        dispatch_time(
            DISPATCH_TIME_NOW,
            Int64(delay * Double(NSEC_PER_SEC))
        ),
        dispatch_get_main_queue(), closure)
}

