//
//  CollapsibleTableViewHeader.swift
//  FiverMay1
//
//  Created by Gleb Serediuk on 18.05.2022.
//

import UIKit

protocol CollapsibleTableViewHeaderDelegate {
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int)
}

final class CollapsibleTableViewHeader: UITableViewHeaderFooterView {
    let titleLabel = UILabel()
    let arrowLabel = UILabel()
    let notifyIcon = UIImageView(frame: CGRect(x: 0, y: 0, width: 12, height: 12))
    
    var delegate: CollapsibleTableViewHeaderDelegate?
    var section: Int = 0
    
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)

        addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(CollapsibleTableViewHeader.tapHeader(_:))))
        
        // Content View
          let marginGuide = contentView.layoutMarginsGuide

          // Arrow label
          contentView.addSubview(arrowLabel)
          arrowLabel.textColor = UIColor.white
          arrowLabel.translatesAutoresizingMaskIntoConstraints = false
          arrowLabel.widthAnchor.constraint(equalToConstant: 12).isActive = true
          arrowLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
          arrowLabel.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor).isActive = true
          arrowLabel.bottomAnchor.constraint(equalTo: marginGuide.bottomAnchor).isActive = true

          // Title label
          contentView.addSubview(titleLabel)
          titleLabel.textColor = UIColor.white
          titleLabel.translatesAutoresizingMaskIntoConstraints = false
          titleLabel.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
          titleLabel.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor).isActive = true
        
        contentView.addSubview(notifyIcon)
        notifyIcon.translatesAutoresizingMaskIntoConstraints = false
        notifyIcon.topAnchor.constraint(equalTo: marginGuide.topAnchor).isActive = true
        notifyIcon.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func tapHeader(_ gestureRecognizer: UITapGestureRecognizer) {
        guard let cell = gestureRecognizer.view as? CollapsibleTableViewHeader else {
            return
        }
        delegate?.toggleSection(self, section: cell.section)
    }
    
    func setCollapsed(_ collapsed: Bool) {
        arrowLabel.transform = CGAffineTransform(rotationAngle: collapsed ? 0.0 : .pi / 1)
    }
    
}
