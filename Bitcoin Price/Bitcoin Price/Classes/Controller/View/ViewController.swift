//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by Faizal on 24/08/19.
//  Copyright © 2018 Faizal . All rights reserved.
//

import Charts
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet

    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet weak var bodyView: BodyView!

    // MARK: - Variable

    private let currentPriceService = CurrentPriceService()
    

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        let ref = UserDefaults.standard.reference()

        setupVariables()
        setupViews(reference: ref)

        callCurrentPriceService()
       
    }

    // MARK: - Public

    func callCurrentPriceService() {
        currentPriceService.get()

        if let priceView = bodyView.priceView {
            priceView.spinnerView.show(onView: priceView)
        }
    }

   

    // MARK: - Private

    private func setupVariables() {
        currentPriceService.delegate = self
       
    }

    private func setupViews(reference: ReferenceType) {
        headerView.delegate = self
        
    }

}
