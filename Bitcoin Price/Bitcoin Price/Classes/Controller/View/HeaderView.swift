//
//  HeaderView.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import UIKit

class HeaderView: UIView {

    // MARK: - Outlet

    @IBOutlet private weak var titleLabel: UILabel!

    // MARK: - Variable

    weak var delegate: HeaderViewDelegate?

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        self.titleLabel.text = "body_price_view.title".localized
    }

    // MARK: - Action

    @IBAction func refreshSelect(_ sender: UIButton) {
        sender.heartAnimation()
        delegate?.headerViewRefreshDidSelect()
    }

}

protocol HeaderViewDelegate: class {
    func headerViewRefreshDidSelect()
}
