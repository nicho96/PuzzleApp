//
//  SlideView.swift
//  Puzzle
//
//  Created by Nicholas Mercier on 2017-03-02.
//  Copyright © 2017 Nicholas Mercier. All rights reserved.
//

import Foundation
import UIKit

class SlideView : UIView {
    
    var imageview:UIImageView!
    var label:UILabel!
    var index:Int!
    
    init(frame: CGRect, index:Int) {
        super.init(frame:frame)
        self.imageview = UIImageView(frame: frame)
        self.label = UILabel()
        self.label.text = "\(index)"
        self.label.sizeToFit()
        self.index = index
        
        imageview.frame = self.bounds
        let x = (self.frame.width - label.frame.width) / 2
        let y = (self.frame.height - label.frame.height) / 2
        label.frame = CGRect(x: x, y: y, width: label.frame.width, height: label.frame.height)
        
        self.addSubview(imageview)
        self.addSubview(label)
        
        if index == 8 {
            self.backgroundColor = UIColor.white
        }else{
            self.backgroundColor = UIColor.red
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
