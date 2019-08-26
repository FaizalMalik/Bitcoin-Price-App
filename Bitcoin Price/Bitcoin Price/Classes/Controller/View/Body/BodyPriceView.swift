//
//  BodyPriceView.swift
//  BitPrice
//
//  Created by Bruno Tortato Furtado on 26/01/18.
//  Copyright © 2018 Bruno Tortato Furtado. All rights reserved.
//

import UIKit
import Pastel

class BodyPriceView: UIView {

    // MARK: - Outlet

    @IBOutlet private weak var updatedLabel: UILabel!
    @IBOutlet private weak var priceLabel: UILabel!

    // MARK: - Variables

    var spinnerView = SpinnerView()

    // MARK: - UIView

    override func awakeFromNib() {
        super.awakeFromNib()
        self.updatedLabel.text = "-"
        self.priceLabel.text = "-"
        
        
        
        let pastelView = PastelView(frame: self.bounds)
        pastelView.startPastelPoint = .bottomLeft
        pastelView.endPastelPoint = .topRight
        // Custom Duration
        pastelView.animationDuration = 2.0
        // Custom Color
        pastelView.setColors([UIColor(red: 156/255, green: 39/255, blue: 176/255, alpha: 1.0),
                              UIColor(red: 255/255, green: 64/255, blue: 129/255, alpha: 1.0),
                              UIColor(red: 123/255, green: 31/255, blue: 162/255, alpha: 1.0),
                              ])
        pastelView.startAnimation()
        self.insertSubview(pastelView, at: 0)
        
        
    }

    // MARK: - Public

    func setPrice(_ price: Float, date: Date? = nil) {
        self.priceLabel.text = price.toCurrencyString()
        self.priceLabel.shimmerAnimation()

        if let date = date {
            setUpdated(date: date)
        }
    }

    // MARK: - Private

    private func setUpdated(date: Date) {
        let dateFormat = "body_price_view.date_format".localized
        self.updatedLabel.text = date.toString(dateFormat: dateFormat)
        self.updatedLabel.shimmerAnimation()
    }

}
