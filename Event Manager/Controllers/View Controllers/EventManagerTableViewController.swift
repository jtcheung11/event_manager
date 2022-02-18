//
//  EventManagerTableViewController.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import UIKit

class EventManagerTableViewController: UITableViewController {

    //OUTLETS
  
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        tableView.reloadData()
    }

    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return EventController.shared.events.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "eventCell", for: indexPath) as? EventManagerTableViewCell else { return  UITableViewCell() }
        
        let event = EventController.shared.events[indexPath.row]
        cell.delegate = self
        cell.event = event
        return cell
    }

    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let event = EventController.shared.events[indexPath.row]
            EventController.shared.delete(event: event)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }

    // MARK: - Navigation

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toEventDetailVC" {
            guard let indexPath = tableView.indexPathForSelectedRow,
                  let destination = segue.destination as? EventDetailViewController else { return }
            let event = EventController.shared.events[indexPath.row]
            destination.event = event
        }
    }

}//End of class

extension EventManagerTableViewController: EventCompletionDelegate {
    func eventCellButtonTapped(sender: EventManagerTableViewCell) {
        guard let indexPath = tableView.indexPath(for: sender) else { return }
        let event = EventController.shared.events[indexPath.row]
        EventController.shared.toggleIsComplete(event: event)
        sender.updateViews()
    }
}

