//
//  ViewController.swift
//  AppleTutorialUIKit
//
//  Created by 佐々木一樹 on 2023/06/03.
//

import UIKit

class ReminderListViewController: UICollectionViewController {
    
    var dataSource: DataSource!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.collectionViewLayout = createListLayout()
        configureDataSource()
        applySnapshot()
    }
    
    private func configureDataSource() {
        let cellRegistration = UICollectionView.CellRegistration(handler: cellRegistrationHandler)
        
        dataSource = DataSource(collectionView: collectionView) {
            (collectionView: UICollectionView, indexPath: IndexPath, itemIdentifier: String) in
            collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: itemIdentifier)
        }
        
        
        collectionView.dataSource = dataSource
    }
    
    private func createListLayout() -> UICollectionViewCompositionalLayout {
        var listConfiguration = UICollectionLayoutListConfiguration(appearance: .grouped)
        listConfiguration.showsSeparators = false
        listConfiguration.backgroundColor = .clear
        return UICollectionViewCompositionalLayout.list(using: listConfiguration)
    }
    
    private func applySnapshot() {
        var snapshot = Snapshot()
        snapshot.appendSections([0])
        snapshot.appendItems(Reminder.sampleData.map { $0.title })
        dataSource.apply(snapshot)
    }
}