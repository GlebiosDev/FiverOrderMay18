//
//  TableViewCellItemTableViewCell.swift
//  FiverMay1
//
//  Created by Gleb Serediuk on 18.05.2022.
//

import UIKit

class TableViewCellItemTableViewCell: UITableViewCell {

    static var identifier = "TableViewCellItemTableViewCell"
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configureUI()
    }
    
    private func configureUI() {
        self.titleLabel.textColor = .white
        self.titleLabel.font = .systemFont(ofSize: 18, weight: .medium)
        self.subTitleLabel.textColor = .white
        self.subTitleLabel.font = .systemFont(ofSize: 14, weight: .regular)
        self.valueLabel.textColor = .white
        self.valueLabel.font = .systemFont(ofSize: 18, weight: .regular)
    }
    
}
