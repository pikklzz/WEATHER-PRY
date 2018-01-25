//
//  ForecastCollectionViewCell.swift
//  WEATHER PRY
//
//  Created by Makarevich, Dmitry on 1/25/18.
//  Copyright © 2018 Makarevich, Dmitry. All rights reserved.
//

import UIKit
import SDWebImage

class ForecastCollectionViewCell: UICollectionViewCell, Forecastable {
    
    static let cellID = "ForecastCollectionViewCell"
    
    let date = UILabel()
    let minMaxTemperature = UILabel()
    let pressure = UILabel()
    let windSpeed = UILabel()
    
    internal let currentWeatherView = UIView()
    internal let weatherData = UIView()
    let currentTemperature = UILabel()
    let currentWeatherIcon = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configureCellContent()
        contentView.addSubview(weatherData)
        contentView.addSubview(currentWeatherView)
        
        layoutCellContent()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func preferredLayoutAttributesFitting(_ layoutAttributes: UICollectionViewLayoutAttributes) -> UICollectionViewLayoutAttributes
    {
        let attributes: UICollectionViewLayoutAttributes = layoutAttributes.copy() as! UICollectionViewLayoutAttributes
        
        var newFrame = attributes.frame
        self.frame = newFrame
        
        self.setNeedsLayout()
        self.layoutIfNeeded()
        
        let desiredHeight: CGFloat = self.contentView.systemLayoutSizeFitting(UILayoutFittingCompressedSize).height
        newFrame.size.height = desiredHeight
        attributes.frame = newFrame
        return attributes
    }
    
}
