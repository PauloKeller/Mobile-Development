//
//  MVCCourseCell.swift
//  MVC
//
//  Created by Brian Voong on 6/30/18.
//  Copyright © 2018 Brian Voong. All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {
    
    var courseViewModel: CourseViewModel! {
        didSet {
            textLabel?.text = courseViewModel.name
            detailTextLabel?.text = courseViewModel.detailTextString
            accessoryType = courseViewModel.accessoryType
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        super.setHighlighted(highlighted, animated: animated)
        contentView.backgroundColor = isHighlighted ? .highlightColor : .white
        textLabel?.textColor = isHighlighted ? UIColor.white : .mainTextBlue
        detailTextLabel?.textColor = isHighlighted ? .white : .black
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: .subtitle, reuseIdentifier: reuseIdentifier)
        
        // cell customization
        textLabel?.font = UIFont.boldSystemFont(ofSize: 24)
        textLabel?.numberOfLines = 0
        detailTextLabel?.textColor = .black
        detailTextLabel?.font = UIFont.systemFont(ofSize: 20, weight: .light)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError()
    }
}
