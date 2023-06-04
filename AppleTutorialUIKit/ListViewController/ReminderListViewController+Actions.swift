//
//  ReminderListViewController+Actions.swift
//  AppleTutorialUIKit
//
//  Created by 佐々木一樹 on 2023/06/04.
//

import UIKit

extension ReminderListViewController {
    @objc func didPressDoneButton(_ sender: ReminderDoneButton) {
        guard let id = sender.id else { return }
        completeReminder(withId: id)
    }
}
