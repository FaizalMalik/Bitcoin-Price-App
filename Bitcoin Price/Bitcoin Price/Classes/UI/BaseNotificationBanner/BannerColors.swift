//
//  BannerColors.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import NotificationBannerSwift

class BannerColors: BannerColorsProtocol {

    func color(for style: BannerStyle) -> UIColor {
        switch style {
        case .danger:
            return UIColor.App.red
        default:
            return UIColor.App.purple
        }
    }

}
