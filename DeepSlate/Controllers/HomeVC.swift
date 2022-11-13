//
//  HomeVC.swift
//  DeepSlate
//
//  Created by Kwame Agyenim - Boateng on 12/11/2022.
//

import UIKit

class HomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        setupContraints()
        view.backgroundColor = UIColor(red: 0.97, green: 0.97, blue: 0.98, alpha: 1.00)
        navigationController?.navigationBar.isHidden = true
    }
    

   // MARK: Properties -
    lazy var tableview: UITableView = {
        let tb = UITableView(frame: .zero,style: .plain)
        tb.backgroundColor = .clear
        tb.register(HeadingInformationCell.self, forCellReuseIdentifier: HeadingInformationCell.reusableID)
        tb.register(WorkoutCategoryCell.self, forCellReuseIdentifier: WorkoutCategoryCell.reusableID)
        tb.register(WorkoutVideoCell.self, forCellReuseIdentifier: WorkoutVideoCell.reusableID)
        tb.delegate = self
        tb.dataSource = self
        tb.bounces = true
        tb.tableFooterView = UIView()
        tb.tableFooterView = UIView()
        tb.allowsSelection = true
        tb.separatorStyle = .none
        tb.separatorColor = .clear
        tb.showsVerticalScrollIndicator = false
        tb.translatesAutoresizingMaskIntoConstraints = false
        return tb
    }()
    func setupViews(){
        view.addSubview(tableview)
    }
    func setupContraints(){
        tableview.pinToEdges(to: view)
    }

}

extension HomeVC:UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.row {
        case 0:
            let cell = tableview.dequeueReusableCell(withIdentifier: HeadingInformationCell.reusableID, for: indexPath) as! HeadingInformationCell
            cell.selectionStyle = .none
            return cell
        case 1:
            let cell = tableview.dequeueReusableCell(withIdentifier: WorkoutCategoryCell.reusableID, for: indexPath) as! WorkoutCategoryCell
            cell.selectionStyle = .none
            return cell
        case 2:
            let cell = tableview.dequeueReusableCell(withIdentifier: WorkoutVideoCell.reusableID, for: indexPath) as! WorkoutVideoCell
            cell.selectionStyle = .none
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.row {
        case 0:
            return CGFloat(250)
        case 1:
            return CGFloat(160)
        case 2:
            return CGFloat(380)
        default:
            return CGFloat()
        }
    }
    
}
