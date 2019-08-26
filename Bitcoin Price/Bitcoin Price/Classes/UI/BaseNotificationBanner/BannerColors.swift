//
//  BannerColors.swift
//  BitcoinPrice
//
//  Created by Faizal on 02/02/18.
//  Copyright © 2018 Faizal . All rights reserved.
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
