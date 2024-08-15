//
//  ToDoCell.swift
//  ToDoList.Tezer
//
//  Created by Nathan Tezer on 14/03/24.
//
//

import UIKit

@objc protocol ToDoCellDelegate: class {
    func checkmarkTapped(sender: ToDoCell)
}

class ToDoCell: UITableViewCell {
    @IBOutlet weak var isCompleteButton: UIButton!
    @IBOutlet weak var titleLabel: UILabel!
    
    var delegate: ToDoCellDelegate?
    
    @IBAction func completeButtonTapped() {
        delegate?.checkmarkTapped(sender: self)
    }

}
