//
//  SupportTableViewCell.swift
//  FiverMay1
//
//  Created by Gleb Serediuk on 19.05.2022.
//

import UIKit

final class SupportTableViewCell: UITableViewCell {

    static let identifier = "SupportTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var icon: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }

    private func setUpUI() {
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 16, weight: .medium)
    }
    
}
