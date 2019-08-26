//
//  LineChartViewExtension.swift
//  BitcoinPrice
//
//  Created by Faizal on 26/08/19.
//  Copyright © 2019 Faizal . All rights reserved.
//


import UIKit
import Charts
enum Interval: String {
    case Day     = "daily"
    case Month   = "monthly"
    case Alltime = "alltime"
}


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
        var position = 0.0

       
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
