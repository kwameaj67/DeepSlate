//
//  CategoryCell.swift
//  DeepSlate
//
//  Created by Kwame Agyenim - Boateng on 12/11/2022.
//

import UIKit

class CategoryCell: UICollectionViewCell {
    
    var data: Category?{
        didSet{
            manageData()
        }
    }
    static let reusableID = "CategoryCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
        setupContraints()
        backgroundColor = .clear
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override var isSelected: Bool{
        didSet{
            container.backgroundColor = isSelected ? .black : .white
            titleLabel.textColor = isSelected ? .white : .black
        }
    }
    // MARK: Properties -
    let container: UIView = {
        let v = UIView()
        v.backgroundColor = .white
        v.layer.cornerRadius = 60/2
        v.translatesAutoresizingMaskIntoConstraints = false
        return v
    }()
    let titleLabel: UILabel = {
        let lb = UILabel()
        lb.textColor = .black.withAlphaComponent(0.9)
        lb.font = UIFont(name: Font.medium.rawValue, size: 14)
        lb.translatesAutoresizingMaskIntoConstraints = false
        return lb
    }()
    let cancelButton: UIButton = {
        var btn = UIButton()
        let image = UIImage(systemName: "xmark")?.withConfiguration(UIImage.SymbolConfiguration(pointSize: 14))
        btn.setImage(image, for: .normal)
        btn.backgroundColor = .clear
        btn.tintColor = .white
        btn.isHidden = true
        btn.alpha = 0
        btn.adjustsImageWhenHighlighted = false
        btn.translatesAutoresizingMaskIntoConstraints = false
        return btn
    }()
    
    func setupViews(){
        addSubview(container)
        container.addSubview(titleLabel)
    }
    func setupContraints(){
        NSLayoutConstraint.activate([
            container.topAnchor.constraint(equalTo: topAnchor),
            container.leadingAnchor.constraint(equalTo: leadingAnchor),
            container.trailingAnchor.constraint(equalTo: trailingAnchor),
            container.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.centerYAnchor.constraint(equalTo: container.centerYAnchor),
            titleLabel.centerXAnchor.constraint(equalTo: container.centerXAnchor)
        ])
    }
    func manageData(){
        guard let item = data else { return }
        titleLabel.text = item.name
    }
}
