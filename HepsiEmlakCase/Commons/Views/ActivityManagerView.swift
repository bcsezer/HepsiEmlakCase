//
//  ActivityIndicator.swift
//  HepsiEmlakCase
//
//  Created by cem sezeroglu on 29.03.2022.
//

import UIKit

class ActivityManagerView {
    
    public func configureActivity(activityIndicator: UIActivityIndicatorView, view: UIView) {
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.large
        activityIndicator.color = Colors.red
        activityIndicator.center = CGPoint(x: view.bounds.midX, y: view.bounds.midY)
        activityIndicator.autoresizingMask = [
            .flexibleLeftMargin,
            .flexibleRightMargin,
            .flexibleTopMargin,
            .flexibleBottomMargin
        ]
        view.addSubview(activityIndicator)
    }
}
