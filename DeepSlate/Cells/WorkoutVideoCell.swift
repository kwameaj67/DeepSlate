//
//  WorkoutVideoCell.swift
//  DeepSlate
//
//  Created by Kwame Agyenim - Boateng on 12/11/2022.
//

import UIKit

struct WorkVideo{
    let title: String
    let duration: String
    let bg_image: String
    let profile_image: String
    let subtitle: String
    
    static let data:[WorkVideo] = [
        WorkVideo(title: "Daily move", duration: "6 min", bg_image: "yoga1", profile_image: "profile1", subtitle: "A daily stretching practice for everyone"),
        WorkVideo(title: "Daily Calm", duration: "10 min", bg_image: "yoga2", profile_image: "profile2", subtitle: "A daily stretching practice for everyone"),
        WorkVideo(title: "Daily move", duration: "5 min", bg_image: "yoga3", profile_image: "profile3", subtitle: "A daily stretching practice for everyone"),
        WorkVideo(title: "Daily move", duration: "15 min", bg_image: "yoga4", profile_image: "profile1", subtitle: "A daily stretching practice for everyone"),
    ]
}
class WorkoutVideoCell: UITableViewCell {
    let videoData = WorkVideo.data
    static let reusableID = "WorkoutVideoCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: WorkoutVideoCell.reusableID)
        setupViews()
        setupContraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
  
    // MARK: Properties -
    lazy var categoryCollectionView: UICollectionView = {
            let layout:UICollectionViewFlowLayout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 10, left: 20, bottom: 15, right: 20)
            layout.scrollDirection = .horizontal
            let cv = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewLayout.init())
            cv.setCollectionViewLayout(layout, animated: false)
            cv.register(VideoCourseCell.self, forCellWithReuseIdentifier: VideoCourseCell.reusableID)
            cv.backgroundColor = .clear
            cv.delegate = self
            cv.dataSource = self
            cv.isScrollEnabled = true
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

extension WorkoutVideoCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videoData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: VideoCourseCell.reusableID, for: indexPath) as! VideoCourseCell
        cell.data = videoData[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 300, height: 330)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 15
    }
        
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 15
    }
    
}
