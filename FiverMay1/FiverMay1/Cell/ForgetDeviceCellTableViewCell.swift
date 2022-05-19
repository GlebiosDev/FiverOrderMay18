//
//  ForgetDeviceCellTableViewCell.swift
//  FiverMay1
//
//  Created by Gleb Serediuk on 19.05.2022.
//

import UIKit

final class ForgetDeviceCellTableViewCell: UITableViewCell {
    
    static var identifier = "ForgetDeviceCellTableViewCell"
    
    @IBOutlet weak var forgetDeviceButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setUpUI()
    }
    
    private func setUpUI() {
        self.forgetDeviceButton.setTitle("FORGET MY DEVICE", for: .normal)
        self.forgetDeviceButton.setTitleColor(.blue, for: .normal)
        self.forgetDeviceButton.layer.borderWidth = 3.0
        self.forgetDeviceButton.layer.borderColor  = UIColor.blue.cgColor
        self.forgetDeviceButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        self.forgetDeviceButton.layer.cornerRadius = 5.0
    }
    
    @IBAction func forgetDeviceAction(_ sender: UIButton) {
        debugPrint("Forget device action")
    }
    
}
