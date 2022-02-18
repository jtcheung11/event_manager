//
//  EventDetailViewController.swift
//  Event Manager
//
//  Created by Jonmichael Cheung on 2/17/22.
//

import UIKit

class EventDetailViewController: UIViewController {

    var event: Event?
    var date: Date?
    
    @IBOutlet weak var eventDatePicker: UIDatePicker!
    @IBOutlet weak var eventNameTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()
    }
    
    func updateView() {
        guard let event = event else { return }
        eventDatePicker.date = event.fireDate!
        eventNameTextField.text = event.title
    }
    

    @IBAction func saveButtonTapped(_ sender: UIBarButtonItem) {
        guard let title = eventNameTextField.text, !title.isEmpty else { return }
        if let event = event {
            EventController.shared.update(event: event, newTitle: title, newFireDate: eventDatePicker.date)
        } else {
            EventController.shared.createEvent(withTitle: title, and: eventDatePicker.date)
        }
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func datePickerChanged(_ sender: UIDatePicker) {
        self.date = eventDatePicker.date
    }
    
}
