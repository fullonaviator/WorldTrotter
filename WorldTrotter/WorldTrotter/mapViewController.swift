//
//  mapViewController.swift
//  WorldTrotter
//
//  Created by Burton, Andrew M on 10/1/19.
//  Copyright © 2019 Burton, Andrew M. All rights reserved.
//

import UIKit
import MapKit

class mapViewController: UIViewController {
    
    var mapView: MKMapView?
    
    override func loadView() {
        let mapView = MKMapView(frame:.zero)
        
        self.view = mapView
        self.mapView = mapView
        
        let standard = NSLocalizedString("Standard", comment: "Standard Map View")
        let hybrid = NSLocalizedString("Hybrid", comment: "Hybrid Map View")
        let satillite = NSLocalizedString("Satillite", comment: "Satillite Map View")
        
        let segmentedControl = UISegmentedControl(items:
            [standard, hybrid, satillite])
        segmentedControl.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        
        segmentedControl.selectedSegmentIndex = 0
        mapView.addSubview(segmentedControl)
        
        
        //Constraints
        
        
    
        segmentedControl.topAnchor.constraint(equalTo: mapView.safeAreaLayoutGuide.topAnchor, constant: 8.0).isActive = true
        
        mapView.layoutMarginsGuide.leadingAnchor.constraint(equalTo: segmentedControl.leadingAnchor).isActive = true
        mapView.layoutMarginsGuide.trailingAnchor.constraint(equalTo: segmentedControl.trailingAnchor).isActive = true
        
        segmentedControl.addTarget(self, action: #selector(segmentedControlDidChange(_:)), for: .valueChanged)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print ("Map viewDidLoad")
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print ("Map viewDidAppear")
    }
    
    @objc
    func segmentedControlDidChange(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            self.mapView?.mapType = .standard
        case 1:
            self.mapView?.mapType = .hybrid
        case 2:
            self.mapView?.mapType = .satellite
        default:
            break
        }
    }
    
}
