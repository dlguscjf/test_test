//
//  TotalMapViewController.swift
//  practice1
//
//  Created by D7702_09 on 2018. 6. 20..
//  Copyright © 2018년 jik. All rights reserved.
//

import UIKit
import MapKit


class TotalMapViewController: UIViewController {

    @IBOutlet weak var total: MKMapView!
    
    var name : [String] = []
    var address : [String] = []
    var annotations = [MKPointAnnotation]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMap(tMapAddress: address, tMapName: name)

        // Do any additional setup after loading the view.
    }
    
    var count = 0
    func viewMap (tMapAddress: [String], tMapName:[String]) {
        for loc in tMapAddress {
            let geoCoder = CLGeocoder()
            geoCoder.geocodeAddressString(loc, completionHandler:{ (placemarks: [CLPlacemark]?, error: Error?) -> Void in if let error = error {
                print(error)
                return
                }
                if placemarks != nil {
                    let placemark = placemarks![0]
                    print(placemarks![0])
                    
                    let annotation = MKPointAnnotation()
                    if let location = placemark.location {
                        annotation.title = self.name[self.count]
                        annotation.subtitle = self.address[self.count]
                        self.count = self.count + 1
                        annotation.coordinate = location.coordinate
                        self.annotations.append(annotation)
                        self.total.addAnnotations(self.annotations)
                        
                    }
                }
                self.total.showAnnotations(self.annotations, animated: true)
        })
    }
    
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    

}
