//
//  GPSViewController.h
//  TimeConnect
//
//  Created by Le, Huy on 6/14/14.
//  Copyright (c) 2014 Cambridge Interns. All rights reserved.
//

#import <UIKit/UIKit.h>

//Add location framework
#import <CoreLocation/CoreLocation.h>

//Google Maps
#import <GoogleMaps/GoogleMaps.h>

@interface GPSViewController : UIViewController <UIApplicationDelegate, CLLocationManagerDelegate>

//Add a location manager property to this app delegate
@property (strong, nonatomic) CLLocationManager *locationManager;

@end
