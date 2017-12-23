//
//  CircleImage.swift
//  Smack
//
//  Created by Alexander Nelson on 12/20/17.
//  Copyright © 2017 Alexander Nelson. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    override func awakeFromNib() {
        setupView()
    }
    
    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        setupView()
    }
}
