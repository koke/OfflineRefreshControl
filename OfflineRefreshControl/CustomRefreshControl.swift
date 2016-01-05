//
//  CustomRefreshControl.swift
//  OfflineRefreshControl
//
//  Created by Jorge Bernal Ordovas on 04/01/16.
//  Copyright © 2016 WordPress. All rights reserved.
//

import UIKit

class CustomRefreshControl: UIRefreshControl {
    var message: String? = nil {
        didSet {
            messageLabel.text = message
            displayingMessage = (message != nil)
        }
    }
    private var displayingMessage: Bool = false {
        didSet {
            if displayingMessage && !oldValue {
                messageLabel.hidden = false
                tintColor = UIColor.clearColor()
                super.beginRefreshing()
            } else if !displayingMessage && oldValue {
                messageLabel.hidden = true
                tintColor = nil
                super.endRefreshing()
            }
        }
    }

    private let messageLabel: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor(red: 43/255, green: 172/255, blue: 218/255, alpha: 1)
        label.textColor = UIColor.whiteColor()
        label.hidden = true
        label.text = nil
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews()
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        messageLabel.frame = bounds
    }

    func addSubviews() {
        addSubview(messageLabel)
    }

    override func beginRefreshing() {
        super.beginRefreshing()
    }

    override func endRefreshing() {
        super.endRefreshing()
    }
}
