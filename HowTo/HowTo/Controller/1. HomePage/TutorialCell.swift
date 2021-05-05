//
//  HowToCell.swift
//  HowTo
//
//  Created by Novi Gunawan on 29/04/21.
//

import UIKit

class TutorialCell: UITableViewCell {

    
    //Color
    @IBOutlet weak var fgColor: UIView!
    @IBOutlet weak var bgColor: UIView!
    
    //Image
    @IBOutlet weak var tutorialImage: UIImageView!
    
    //Label
    @IBOutlet weak var tutorialLabel: UILabel!
    @IBOutlet weak var bgTime: UIView!
    @IBOutlet weak var timeLabel: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
