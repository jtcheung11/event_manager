//
//  EventManagerTableViewCell.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import UIKit

protocol EventCompletionDelegate: AnyObject {
    func eventCellButtonTapped(sender: EventManagerTableViewCell)
    
}

class EventManagerTableViewCell: UITableViewCell {
    
    var event: Event? {
        didSet {
            updateViews()
        }
    }
    
    weak var delegate: EventCompletionDelegate?
    
//Outlets
    @IBOutlet weak var clockButton: UIButton!
    @IBOutlet weak var eventTitleLabel: UILabel!
    
//Actions
    @IBAction func clockButtonTapped(_ sender: UIButton) {
        if let delegate = delegate {
            delegate.eventCellButtonTapped(sender: self)
        }
    }
    
    //Do I need a parameter or with:event??
    func updateViews() {
        guard let event = event else { return }
        eventTitleLabel.text = event.title
        if event.isComplete {
            clockButton.setImage(UIImage(systemName: "clock"), for: .normal)
        } else {
            clockButton.setImage(UIImage(systemName: "clock.fill"), for: .normal)
        }
    }
    
}
