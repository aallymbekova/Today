//
//  ReminderListViewController + Actions.swift
//  Today
//
//  Created by Aliya Alymbekova on 6/12/24.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
