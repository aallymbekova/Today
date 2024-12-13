//
//  EKReminder+ Reminder.swift
//  Today
//
//  Created by Aliya Alymbekova on 13/12/24.
//

import EventKit
import Foundation

extension EKReminder {
    func update(using reminder: Reminder, in store: EKEventStore) {
        title = reminder.title
        notes = reminder.notes
        isCompleted = reminder.isComplete
        calendar = store.defaultCalendarForNewReminders()
        alarms?.forEach{ alarm in
            guard let absoluteDate = alarm.absoluteDate else { return }
            let comprasion = Locale.current.calendar.compare(reminder.dueDate, to: absoluteDate, toGranularity: .minute)
            if comprasion != .orderedSame {
                removeAlarm(alarm)
            }
        }
        if !hasAlarms {
            addAlarm(EKAlarm(absoluteDate: reminder.dueDate))
        }
    }
}
