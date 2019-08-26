//
//  FooterView.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import UIKit

class FooterView: UIView {

    // MARK: - Outlets

    @IBOutlet private weak var weekButton: Button!
    @IBOutlet private weak var monthButton: Button!
    @IBOutlet private weak var yearButton: Button!

    // MARK: - Variables

    weak var delegate: FooterViewDelegate?

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        unselectAll()
        weekButton.setTitle(ReferenceType.week.rawValue.localized, for: .normal)
        monthButton.setTitle(ReferenceType.month.rawValue.localized, for: .normal)
        yearButton.setTitle(ReferenceType.year.rawValue.localized, for: .normal)

        
    }

    // MARK: - Public

    func setReference(_ type: ReferenceType) {
        unselectAll()
        let button: Button

        switch type {
        case .week: button = weekButton
        case .month: button = monthButton
        case .year: button = yearButton
       
        }

        button.isSelected = true
    }

    // MARK: - Action

    @IBAction func buttonSelect(_ sender: Button) {
        unselectAll()
        sender.isSelected = true
        let type: ReferenceType

        if sender == weekButton {
            type = .week
        } else if sender == monthButton {
            type = .month
        } else {
            type = .year
        }

        delegate?.footerViewButtonDidSelect(type: type)
}

    // MARK: - Private

    private func unselectAll() {
        weekButton.isSelected = false
        monthButton.isSelected = false
        yearButton.isSelected = false
       
    }

}

protocol FooterViewDelegate: class {
    func footerViewButtonDidSelect(type: ReferenceType)
}
