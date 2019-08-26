//
//  Button.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import UIKit

class Button: UIButton {

    // MARK: - Variable

    override var isHighlighted: Bool {
        didSet {
            let alpha: CGFloat = isHighlighted ? 0.25 : 1
            backgroundColor = backgroundColor?.withAlphaComponent(alpha)
        }
    }

    override var isSelected: Bool {
        didSet {
            let color: UIColor

            if isSelected {
                color = UIColor.App.purple
            } else {
                color = UIColor.App.white
            }

            backgroundColor = color
        }
    }

    // MARK: - UIButton

    override func awakeFromNib() {
        super.awakeFromNib()
        addShadow()
    }

}
