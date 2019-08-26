//
//  StatusBarNotificationBanner+App.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import NotificationBannerSwift

extension StatusBarNotificationBanner {

    class var noConnection: StatusBarNotificationBanner {
        let title = "banner.no_connection".localized
        return StatusBarNotificationBanner(title: title, style: .info, colors: BannerColors())
    }

    class var serverFailure: StatusBarNotificationBanner {
        let title = "banner.server_failure".localized
        return StatusBarNotificationBanner(title: title, style: .danger, colors: BannerColors())
    }

}
