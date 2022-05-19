//
//  ViewController.swift
//  FiverMay1
//
//  Created by Gleb Serediuk on 18.05.2022.
//

import UIKit

// MARK: - ViewController

final class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties
    
    var sections = [Section]()
    
    // MARK: - LifeCycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpDelegates()
        setUpUI()
        
        sections = generateSections()
    }
    
    // MARK: - Funcs
    
    private func generateSections() -> [Section] {
        return [Section(name: "My Voice Selector Converse", items: generateVoiceSelectorCells()),
                Section(name: "My Bluetooth Earphones", items: generateBluetoothCells()),
                Section(name: "My Iphone", items: generateIphoneCells()),
                Section(name: "Support", items: generateSupportCells())
        ]
    }
    
    private func generateVoiceSelectorCells() -> [Cell] {
        return [Cell(title: "Serial Number", value: "204920FSFW2"),
                Cell(title: "Hardware version", value: "0.0.0.1"),
                Cell(title: "Firmware version", subTitle: "You have the latest version", value: "1.2.5"),
                Cell(title: "", subTitle: "", value: "")]
    }
    
    private func generateBluetoothCells() -> [Cell] {
        return [Cell(title: "Name", value: "204FSFW2")]
    }
    
    private func generateIphoneCells() -> [Cell] {
        return [Cell(title: "Model Name", value: UIDevice.modelName),
                Cell(title: "iOS Version", value: UIDevice.current.systemVersion),
                Cell(title: "AppVersion", subTitle: "", value: Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "0.0.0")
        ]
    }
    
    private func generateSupportCells() -> [Cell] {
        return [Cell(icon: UIImage(named: "userManual"), title: "User Manual", value: UIDevice.modelName),
                Cell(icon: UIImage(named: "playVideo"), title: "How to videos", value: UIDevice.current.systemVersion),
                Cell(icon: UIImage(named: "contactUs"), title: "Contact us")
        ]
    }
    
    private func setUpUI() {
        self.tableView.backgroundColor = .clear
        self.tableView.estimatedRowHeight = 44.0
        self.tableView.rowHeight = UITableView.automaticDimension
    }
    
    private func setUpDelegates() {
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.tableView.register(UINib(nibName: TableViewCellItemTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: TableViewCellItemTableViewCell.identifier)
        self.tableView.register(UINib(nibName: ForgetDeviceCellTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: ForgetDeviceCellTableViewCell.identifier)
        self.tableView.register(UINib(nibName: SupportTableViewCell.identifier, bundle: nil),
                                forCellReuseIdentifier: SupportTableViewCell.identifier)
    }
}

//MARK: - UITableViewDataSource , UITableViewDelegate

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sections[section].collapsed ? 0 : sections[section].items.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let header = tableView.dequeueReusableHeaderFooterView(withIdentifier: "header") as? CollapsibleTableViewHeader ?? CollapsibleTableViewHeader(reuseIdentifier: "header")
        
        header.titleLabel.text = sections[section].name
        header.titleLabel.font = .systemFont(ofSize: 20, weight: .heavy)
        header.arrowLabel.text = "↓"
        header.setCollapsed(sections[section].collapsed)
        header.section = section
        
        if header.section == 0 {
            header.notifyIcon.image = UIImage(named: "notify")
        }
        
        header.delegate = self
        
        return header
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let view = UIView()
        let separator = UIView()
        separator.translatesAutoresizingMaskIntoConstraints = false
        // second view
        view.addSubview(separator)
        separator.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 0).isActive = true
        separator.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: 0).isActive = true
        separator.widthAnchor.constraint(equalToConstant: tableView.frame.width - 30).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 1).isActive = true
        
        separator.backgroundColor = .white
        separator.alpha = 0.5
        separator.backgroundColor = .white
        
        return view
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 1.0
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TableViewCellItemTableViewCell.identifier, for: indexPath) as? TableViewCellItemTableViewCell
        else { return UITableViewCell() }
        
        cell.titleLabel.text = sections[indexPath.section].items[indexPath.row].title
        cell.subTitleLabel.text = sections[indexPath.section].items[indexPath.row].subTitle
        cell.valueLabel.text = sections[indexPath.section].items[indexPath.row].value
        // forget cutton cell
        if indexPath.section == 0 && indexPath.row == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: ForgetDeviceCellTableViewCell.identifier, for: indexPath) as? ForgetDeviceCellTableViewCell
            else { return UITableViewCell() }
            return cell
        }
        
        if indexPath.section == 3 {
            guard let cell = tableView.dequeueReusableCell(withIdentifier: SupportTableViewCell.identifier, for: indexPath) as? SupportTableViewCell
            else { return UITableViewCell() }
            
            cell.titleLabel.text = sections[indexPath.section].items[indexPath.row].title
            cell.icon.image = sections[indexPath.section].items[indexPath.row].icon
            
            return cell
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch indexPath.section {
        case 3:
            if let cell = tableView.cellForRow(at: indexPath) as? SupportTableViewCell {
                print(cell.titleLabel.text!)
            }
        default:
            if let cell = tableView.cellForRow(at: indexPath) as? TableViewCellItemTableViewCell {
                print(cell.titleLabel.text!)
            }
        }
    }
    
}

extension ViewController: CollapsibleTableViewHeaderDelegate {
    
    func toggleSection(_ header: CollapsibleTableViewHeader, section: Int) {
        let collapsed = !sections[section].collapsed
        
        // Toggle collapse
        sections[section].collapsed = collapsed
        
        header.setCollapsed(collapsed)
        updateTable(with: section)
        
        for item in sections {
            
            if item.collapsed == false && item.name != sections[section].name {
                
                let index = sections.firstIndex{ $0 === item }
                sections[index!].collapsed = true
                updateTable(with: index!)
            }
        }
    }
    
    private func updateTable(with index: Int) {
        tableView.reloadSections(NSIndexSet(index: index) as IndexSet, with: .automatic)
    }
    
}
