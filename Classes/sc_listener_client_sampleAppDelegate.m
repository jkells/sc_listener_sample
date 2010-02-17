//
//  sc_listener_client_sampleAppDelegate.m
//  sc_listener_client_sample
//
//  Created by Jared Kells on 10/02/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import "sc_listener_client_sampleAppDelegate.h"
#import "sc_listener_client_sampleViewController.h"
#import "SCListener.h"

@implementation sc_listener_client_sampleAppDelegate

@synthesize window;
@synthesize viewController;
@synthesize timer;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
	AudioSessionInitialize(NULL,NULL,NULL,NULL);
	[[SCListener sharedListener] listen];
	timer = [NSTimer scheduledTimerWithTimeInterval: 1 target: self selector: @selector(tick:) userInfo:nil repeats: YES];
	
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}

- (void)tick: (NSTimer*) _timer {
	Float32 peak_power = [[SCListener sharedListener] peakPower];
	Float32 average_power = [[SCListener sharedListener] averagePower];
	Float32 frequency = [[SCListener sharedListener] frequency];
	
	[viewController.peak_power_label setText: [NSString stringWithFormat: @"Peak Power %f", peak_power]];
	[viewController.average_power_label setText: [NSString stringWithFormat: @"Average Power %f", average_power]];
	[viewController.freq_label setText: [NSString stringWithFormat: @"Frequency %f", frequency]];
}

- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
