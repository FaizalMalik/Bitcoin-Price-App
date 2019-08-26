//
//  LineChartViewExtension.swift
//  bitcoin
//
//  Created by Filipe Santos Correa on 16.07.17.
//  Copyright © 2017 Filipe Santos Correa. All rights reserved.
//

import UIKit
import Charts
enum Interval: String {
    case Day     = "daily"
    case Month   = "monthly"
    case Alltime = "alltime"
}

//extension LineChartView:ChartViewDelegate{
//
//    func drawBitcoinChart(historicalData: [ChartValues], interval: Interval) {
//        self.delegate = self
//        self.chartDescription?.enabled = false
//        self.dragEnabled = true
//        self.setScaleEnabled(true)
//        self.pinchZoomEnabled = true
//
//        // x-axis limit line
//        let llXAxis = ChartLimitLine(limit: 10, label: "Index 10")
//        llXAxis.lineWidth = 4
//        llXAxis.lineDashLengths = [10, 10, 0]
//        llXAxis.labelPosition = .rightBottom
//        llXAxis.valueFont = .systemFont(ofSize: 10)
//
//        self.xAxis.gridLineDashLengths = [10, 10]
//        self.xAxis.gridLineDashPhase = 0
//
//        let ll1 = ChartLimitLine(limit: 150, label: "Upper Limit")
//        ll1.lineWidth = 4
//        ll1.lineDashLengths = [5, 5]
//        ll1.labelPosition = .rightTop
//        ll1.valueFont = .systemFont(ofSize: 10)
//
//        let ll2 = ChartLimitLine(limit: -30, label: "Lower Limit")
//        ll2.lineWidth = 4
//        ll2.lineDashLengths = [5,5]
//        ll2.labelPosition = .rightBottom
//        ll2.valueFont = .systemFont(ofSize: 10)
//
//        let leftAxis = self.leftAxis
//        leftAxis.removeAllLimitLines()
//        leftAxis.addLimitLine(ll1)
//        leftAxis.addLimitLine(ll2)
//        leftAxis.axisMaximum = 200
//        leftAxis.axisMinimum = -50
//        leftAxis.gridLineDashLengths = [5, 5]
//        leftAxis.drawLimitLinesBehindDataEnabled = true
//
//        self.rightAxis.enabled = false
//
//        //[_chartView.viewPortHandler setMaximumScaleY: 2.f];
//        //[_chartView.viewPortHandler setMaximumScaleX: 2.f];
//
//        let marker = BalloonMarker(color: UIColor(white: 180/255, alpha: 1),
//                                   font: .systemFont(ofSize: 12),
//                                   textColor: .white,
//                                   insets: UIEdgeInsets(top: 8, left: 8, bottom: 20, right: 8))
//        marker.chartView = self
//        marker.minimumSize = CGSize(width: 80, height: 40)
//        self.marker = marker
//
//        self.legend.form = .line
//
////        sliderX.value = 45
////        sliderY.value = 100
//        //slidersValueChanged(nil)
//         var dataEntries: [ChartDataEntry] = []
//        var dates = [String]()
//        var position = 0.0
//
//
//                for i in 0..<historicalData.count {
//                    let dataEntry = ChartDataEntry(x: Double(position), y: Double(historicalData[i].rate))
//                    dataEntries.append(dataEntry)
//
//                    dates.append(historicalData[i].date)
//                    position += 1.0
//                }
//
////        let values = (0..<45).map { (i) -> ChartDataEntry in
////            let val = Double(arc4random_uniform(100) + 3)
////            return ChartDataEntry(x: Double(i), y: val)
////        }
//
//
//        let set1 = LineChartDataSet(values: dataEntries, label: "")
//        set1.drawIconsEnabled = false
//
//        set1.lineDashLengths = [5, 2.5]
//        set1.highlightLineDashLengths = [5, 2.5]
//        set1.setColor(.black)
//        set1.setCircleColor(.black)
//        set1.lineWidth = 1
//        set1.circleRadius = 3
//        set1.drawCircleHoleEnabled = false
//        set1.valueFont = .systemFont(ofSize: 9)
//        set1.formLineDashLengths = [5, 2.5]
//        set1.formLineWidth = 1
//        set1.formSize = 15
//
//        let gradientColors = [ChartColorTemplates.colorFromString("#00ff0000").cgColor,
//                              ChartColorTemplates.colorFromString("#ffff0000").cgColor]
//        let gradient = CGGradient(colorsSpace: nil, colors: gradientColors as CFArray, locations: nil)!
//
//        set1.fillAlpha = 1
//        set1.fill = Fill(linearGradient: gradient, angle: 90) //.linearGradient(gradient, angle: 90)
//        set1.drawFilledEnabled = true
//
//        let data = LineChartData(dataSet: set1)
//
//        self.data = data
//
//
//         self.animate(xAxisDuration: 2.5)
//
//    }
//
//
//}


// MARK: - LineChartView extension, extends the LineChartView class from the Charts library
extension LineChartView {

    /// Draw a Bitcoin line chart graph
    ///
    /// - Parameters:
    ///   - historicalData: contains Bitcoin data (such as price and time) over a certain time interval
    ///   - interval: indicates the time period in (1 day, 1 month, alltime)
    func drawBitcoinChart(historicalData: [ChartValues], interval: Interval) {
       // let formatter = DateFormatter()
        var dataEntries: [ChartDataEntry] = []
        var dates = [String]()

//        switch interval {
//        case .Day:
//            formatter.dateFormat = "HH:mm"
//        case .Month:
//            formatter.dateFormat = "MM/dd"
//        default:
//            formatter.dateFormat = "yyyy/MM"
//        }
        let dateFormat = "body_price_view.date_format".localized
        var position = 0.0

        // the "bitcoinaverage.com" API returns the historical data in descending order by time -> .reversed()
        for i in 0..<historicalData.count {
            let dataEntry = ChartDataEntry(x: Double(position), y: Double(historicalData[i].rate))
            dataEntries.append(dataEntry)

            dates.append("0")
            position += 1.0
        }

        let lineChartDataSet = LineChartDataSet(values: dataEntries, label: "")
        lineChartDataSet.setColor(UIColor.green)
        lineChartDataSet.mode = .horizontalBezier
        lineChartDataSet.lineWidth = 1.0
        lineChartDataSet.circleRadius = 0.0
        lineChartDataSet.drawHorizontalHighlightIndicatorEnabled = true

        var dataSets = [IChartDataSet]()
        dataSets.append(lineChartDataSet)

        let lineChartData = LineChartData(dataSets: dataSets)
        DispatchQueue.main.async {
            self.animate(xAxisDuration: 1.0)

            self.xAxis.labelPosition = .bottom
            self.xAxis.drawGridLinesEnabled = false
            
            self.xAxis.valueFormatter = IndexAxisValueFormatter(values: dates)
            self.xAxis.labelCount = 20
            self.xAxis.labelTextColor = UIColor.white
            self.rightAxis.enabled = false
            self.leftAxis.labelCount = 4
            self.leftAxis.labelTextColor = UIColor.white
            self.legend.enabled = false
            self.chartDescription = nil
            self.backgroundColor = UIColor.black
            self.leftAxis.axisLineColor = UIColor.green
            self.minOffset = 20.0
            self.data = lineChartData
        }

    }

}
extension LineChartView: IAxisValueFormatter {
    var dateFormatter: DateFormatter?{
        
        return DateFormatter()
    }
    public func stringForValue(_ value: Double, axis: AxisBase?) -> String {
        if let dateFormatter = dateFormatter {
            
            let date = Date(timeIntervalSince1970: value)
            return dateFormatter.string(from: date)
        }
        
        return ""
    }
    
}
