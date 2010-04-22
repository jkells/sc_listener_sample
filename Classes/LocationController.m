//
//  LocationController.m
//  sc_listener_client_sample
//
//  Created by Jared Kells on 22/04/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "LocationController.h"

@implementation LocationController
@synthesize locManager;
@synthesize location;
@synthesize geoCoder;

- (id)init {
    if (self = [super init]) {
        // Initialization code		
		CLLocationManager* _loc = [[[CLLocationManager alloc] init] autorelease];
		self.locManager = _loc;
		[_loc setDelegate:self];
		
    }
    return self;
}

- (void)rescueMe{
	[self.locManager startUpdatingLocation];
}

// Handle this if we dont get a location...
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
	
}

// Got a location start reverse geocode.
- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation{

	// Wait until we get more accurate information.
	// Uncomment this when running on the phone.
	//if([newLocation horizontalAccuracy] > 50)
	//	return;

	// Start geocoding
	MKReverseGeocoder* coder = [[MKReverseGeocoder alloc] initWithCoordinate:newLocation.coordinate];
	[coder setDelegate: self];
	[coder start];
	
	// Stop location updates
	[self.locManager stopUpdatingLocation];
}

// Handle this if we dont get a location.
- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFailWithError:(NSError *)error{
	
}

- (void)reverseGeocoder:(MKReverseGeocoder *)geocoder didFindPlacemark:(MKPlacemark *)placemark{	
	//Send our location to the web service.
	NSString* postCode = [placemark postalCode];
	NSString* street = [placemark thoroughfare];
	NSString* number = [placemark subThoroughfare];
}

- (void)dealloc {
	self.geoCoder = nil;
	self.location = nil;
	self.locManager = nil;
    [super dealloc];
}
@end
