//
//  WorkoutCategoryCell.swift
//  DeepSlate
//
//  Created by Kwame Agyenim - Boateng on 12/11/2022.
//

import UIKit

struct Category{
    let name: String
    let isSelected: Bool
    
    static let data:[Category] = [
        Category(name: "Stretch", isSelected: true),
        Category(name: "🧘‍♂️ Meditation", isSelected: false),
        Category(name: "Kids", isSelected: false),
        Category(name: "☕️ For Work", isSelected: false),
        Category(name: "💨 Breathe", isSelected: false),
        Category(name: "See all", isSelected: false),
    ]
}

class WorkoutCategoryCell: UITableViewCell {
    let workoutData = Category.data
    static let reusableID = "WorkoutCategoryCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WorkoutCategoryCell.reusableID)
        setupViews()
        setupContraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK : Properties -
    lazy var categoryCollectionView: UICollectionView = {
            let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 15, right: 10)
            layout.scrollDirection = .vertical
            layout.sectionInsetReference = .fromSafeArea
            layout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
            let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
            cv.setCollectionViewLayout(layout, animated: false)
            cv.register(CategoryCell.self, forCellWithReuseIdentifier: CategoryCell.reusableID)
            cv.backgroundColor = .clear
            cv.delegate = self
            cv.dataSource = self
            cv.isScrollEnabled = false
            cv.allowsSelection = true
            cv.allowsMultipleSelection = false
            cv.isUserInteractionEnabled = true
            cv.bounces = true
            cv.showsHorizontalScrollIndicator = false
            cv.translatesAutoresizingMaskIntoConstraints = false
            return cv
        }()
    func setupViews(){
        contentView.addSubview(categoryCollectionView)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            categoryCollectionView.topAnchor.constraint(equalTo: contentView.topAnchor),
            categoryCollectionView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            categoryCollectionView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            categoryCollectionView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
        ])
    }
}

extension WorkoutCategoryCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return workoutData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCell.reusableID, for: indexPath) as! CategoryCell
        cell.data = workoutData[indexPath.row]
        switch indexPath.row {
        case 5:
            cell.container.backgroundColor = .clear
            cell.container.layer.borderWidth = 1.0
            cell.container.layer.borderColor = UIColor.systemGray2.cgColor
            cell.titleLabel.textColor = UIColor.systemGray2
        default:
            break
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let item = workoutData[indexPath.row]
        let _ = item.name.size(withAttributes: [NSAttributedString.Key.font:UIFont(name: Font.medium.rawValue, size: 15)!])
        return CGSize(width: 120, height: 60)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 15
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 10
    }
    
}
