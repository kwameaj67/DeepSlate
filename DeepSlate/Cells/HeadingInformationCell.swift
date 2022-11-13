//
//  HeadingInformationCell.swift
//  DeepSlate
//
//  Created by Kwame Agyenim - Boateng on 12/11/2022.
//

import UIKit

class HeadingInformationCell: UITableViewCell {

    static let reusableID = "HeadingInformationCell"
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: HeadingInformationCell.reusableID)
        setupViews()
        setupContraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    // MARK: Properties -
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.text = "Deep Slate."
        lb.textColor = .black.withAlphaComponent(0.9)
        lb.font = UIFont(name: Font.medium.rawValue, size: 16)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let greetingLabel: UILabel = {
        let lb = UILabel()
        lb.numberOfLines = 0
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    
    let circleButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(named: "menu")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 14))
        btn.setImage(image, for: .normal)
        btn.backgroundColor = .white
        btn.tintColor = .black
        btn.adjustsImageWhenHighlighted = false
        btn.layer.cornerRadius = 54/2
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    let searchView: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 55/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let searchIcon : UIImageView = {
        var iv = UIImageView()
        iv.image =  UIImage(systemName: "magnifyingglass")
        iv.tintColor = .systemGray2
        iv.contentMode = .scaleAspectFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
    }()
    let searchTextField: UITextField = {
        var tf = UITextField()
        tf.attributedPlaceholder = NSAttributedString(string: "Search", attributes: [.font: UIFont(name: Font.light.rawValue, size: 15)!,.foregroundColor: UIColor.systemGray4])
        tf.borderStyle = .none
        tf.textColor = .black
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.font = UIFont(name: Font.regular.rawValue, size: 15)
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    func setupViews(){
        contentView.addSubview(titleLabel)
        contentView.addSubview(greetingLabel)
        contentView.addSubview(circleButton)
        contentView.addSubview(searchView)
        searchView.addSubview(searchIcon)
        searchView.addSubview(searchTextField)
        greetingLabel.attributedText = setAttributedTitle("Good Morning,", "Kwame")
    }
    
    func setupContraints(){
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            greetingLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 30),
            greetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            
            circleButton.centerYAnchor.constraint(equalTo: greetingLabel.centerYAnchor),
            circleButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            circleButton.heightAnchor.constraint(equalToConstant: 54),
            circleButton.widthAnchor.constraint(equalToConstant: 54),
            
            searchView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 35),
            searchView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30),
            searchView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -30),
            searchView.heightAnchor.constraint(equalToConstant: 55),
            
            searchIcon.centerYAnchor.constraint(equalTo: searchView.centerYAnchor),
            searchIcon.leadingAnchor.constraint(equalTo: searchView.leadingAnchor, constant: 15),
            searchIcon.heightAnchor.constraint(equalToConstant: 20),
            searchIcon.widthAnchor.constraint(equalToConstant: 20),
            
            searchTextField.topAnchor.constraint(equalTo: searchView.topAnchor,constant: 5),
            
            searchTextField.trailingAnchor.constraint(equalTo: searchView.trailingAnchor, constant: -15),
            searchTextField.bottomAnchor.constraint(equalTo: searchView.bottomAnchor,constant: -5),
            searchTextField.leadingAnchor.constraint(equalTo: searchIcon.trailingAnchor, constant: 15),
            
        ])
    }
    
    func setAttributedTitle(_ title: String,_ subTitle: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(attributedString: NSAttributedString(string: title, attributes: [.font: UIFont(name: Font.medium.rawValue, size: 24)!,.foregroundColor: UIColor.black]))
        attributedText.append(NSAttributedString(string: "\n\(subTitle)", attributes: [.font:UIFont(name: Font.semibold.rawValue, size: 24)!, .foregroundColor: UIColor.black]))
        return attributedText
    }
}
