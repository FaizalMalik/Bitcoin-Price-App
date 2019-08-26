//
//  ViewController.swift
//  BitcoinPrice
//
//  Created by Faizal on 24/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//

import Charts
import UIKit

class ViewController: UIViewController {

    // MARK: - Outlet

    @IBOutlet private weak var headerView: HeaderView!
    @IBOutlet weak var bodyView: BodyView!

    @IBOutlet private weak var footerView: FooterView!
    // MARK: - Variable

    private let currentPriceService = CurrentPriceService()
    private let historicPriceService = HistoricPriceService()

    // MARK: - UIViewController

    override func viewDidLoad() {
        super.viewDidLoad()

        let ref = UserDefaults.standard.reference()

        setupVariables()
        setupViews(reference: ref)

        callCurrentPriceService()
        callHistoricPriceService(reference: ref)
    }
    // MARK: - Public
    
    func callCurrentPriceService() {
        currentPriceService.get()
        
        if let priceView = bodyView.priceView {
            priceView.spinnerView.show(onView: priceView)
        }
    }
    
    func callHistoricPriceService(reference: ReferenceType) {
        historicPriceService.get(reference: reference)
        
        if let historyView = bodyView.historyView {
            historyView.spinnerView.show(onView: historyView)
        }
    }
    
    // MARK: - Private
    
    private func setupVariables() {
        currentPriceService.delegate = self
        historicPriceService.delegate = self
    }
    
    private func setupViews(reference: ReferenceType) {
        headerView.delegate = self
        footerView.delegate = self
        footerView.setReference(reference)

    }
    
}

