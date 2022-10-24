//
//  QuestionCustomTableViewCell.swift
//  FinalProjectIOS
//
//  Created by Stainley A Lebron R on 10/23/22.
//

import UIKit

class QuestionCustomTableViewCell: UITableViewCell {

    @IBOutlet weak var cellContentView: CellCustomHelper!
    @IBOutlet weak var questionCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)        
        
        if highlighted == true {
            cellContentView.backgroundColor = .purple
        } else {
            cellContentView.backgroundColor = .white
        }
    }
    
}
