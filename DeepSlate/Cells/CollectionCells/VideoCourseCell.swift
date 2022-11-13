//
//  VideoCourseCell.swift
//  DeepSlate
//
//  Created by Kwame Agyenim - Boateng on 12/11/2022.
//

import UIKit

class VideoCourseCell: UICollectionViewCell {
    
    var data: WorkVideo? {
        didSet{
            manageData()
        }
    }
    static let reusableID = "VideoCourseCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        layer.cornerRadius = 20
        backgroundColor = .white
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let bg_image : UIImageView = {
        var iv = UIImageView()
        iv.backgroundColor = .systemGray2
        iv.layer.cornerRadius = 20
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let overlayView: UIView = {
        let v = UIView()
        v.layer.cornerRadius = 20
        v.clipsToBounds = true
        v.layer.masksToBounds = true
        v.backgroundColor = .black.withAlphaComponent(0.2)
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.textColor = .black
        lb.font = UIFont(name: Font.medium.rawValue, size: 24)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let durationView: UIView = {
        let v = UIView()
        v.backgroundColor = .white.withAlphaComponent(0.5)
        v.layer.cornerRadius = 35/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let durationLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black
        lb.font = UIFont(name: Font.regular.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let arrowIcon : UIImageView = {
        var iv = UIImageView()
        iv.image =  UIImage(systemName: "arrowtriangle.right.fill")
        iv.tintColor = .black
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let profile_image : UIImageView = {
        var iv = UIImageView()
        iv.layer.cornerRadius = 25
        iv.clipsToBounds = true
        iv.layer.masksToBounds = true
        iv.backgroundColor = .systemGray2
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let videoTextLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    func setupViews(){
        addSubview(bg_image)
        bg_image.addSubview(overlayView)
        overlayView.addSubview(titleLabel)
        overlayView.addSubview(durationView)
        durationView.addSubview(arrowIcon)
        durationView.addSubview(durationLabel)
        addSubview(profile_image)
        addSubview(videoTextLabel)
        
        titleLabel.bringSubviewToFront(overlayView)
       
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            bg_image.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            bg_image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            bg_image.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            bg_image.heightAnchor.constraint(equalToConstant: 180),
            
            overlayView.topAnchor.constraint(equalTo: topAnchor, constant: 5),
            overlayView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 5),
            overlayView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -5),
            overlayView.heightAnchor.constraint(equalToConstant: 180),
            
            titleLabel.topAnchor.constraint(equalTo: bg_image.topAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: bg_image.leadingAnchor, constant: 15),
            titleLabel.widthAnchor.constraint(equalToConstant: 100),
            
            durationView.leadingAnchor.constraint(equalTo: bg_image.leadingAnchor, constant: 15),
            durationView.bottomAnchor.constraint(equalTo: bg_image.bottomAnchor, constant: -10),
            durationView.heightAnchor.constraint(equalToConstant: 35),
            
            arrowIcon.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            arrowIcon.leadingAnchor.constraint(equalTo: durationView.leadingAnchor, constant: 10),
            arrowIcon.trailingAnchor.constraint(equalTo: durationLabel.leadingAnchor, constant: -10),
            arrowIcon.heightAnchor.constraint(equalToConstant: 12),
            arrowIcon.widthAnchor.constraint(equalToConstant: 12),
            
            durationLabel.centerYAnchor.constraint(equalTo: durationView.centerYAnchor),
            durationLabel.trailingAnchor.constraint(equalTo: durationView.trailingAnchor, constant: -15),
            
            profile_image.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -15),
            profile_image.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            profile_image.heightAnchor.constraint(equalToConstant: 100),
            profile_image.widthAnchor.constraint(equalToConstant: 50),
            
            videoTextLabel.centerYAnchor.constraint(equalTo: profile_image.centerYAnchor),
            videoTextLabel.leadingAnchor.constraint(equalTo: profile_image.trailingAnchor, constant: 15),
            videoTextLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20)
            
        ])
    }
    func setAttributedTitle(_ title: String,_ subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [.font: UIFont(name: Font.medium.rawValue, size: 20)!,.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\n\n\(subTitle)", attributes: [.font:UIFont(name: Font.medium.rawValue, size: 16)!, .foregroundColor: UIColor.systemGray3]))
        return attributedText
    }
    
    func manageData(){
        guard let item = data else { return }
        titleLabel.text = item.title
        videoTextLabel.attributedText = setAttributedTitle(item.title, item.subtitle)
        bg_image.image = UIImage(named: item.bg_image)?.withRenderingMode(.alwaysOriginal)
        profile_image.image = UIImage(named: item.profile_image)?.withRenderingMode(.alwaysOriginal)
        durationLabel.text = item.duration
    }
}
