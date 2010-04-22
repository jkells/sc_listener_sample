//
//  LocationController.h
//  sc_listener_client_sample
//
//  Created by Jared Kells on 22/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface LocationController : NSObject <CLLocationManagerDelegate, MKReverseGeocoderDelegate> {
	CLLocationManager* locManager;
	CLLocation* location;
	MKReverseGeocoder* geoCoder;
}

@property (nonatomic, retain) CLLocationManager* locManager;
@property (nonatomic, retain) CLLocation* location;
@property (nonatomic, retain) MKReverseGeocoder* geoCoder;

- (void)rescueMe;

@end
