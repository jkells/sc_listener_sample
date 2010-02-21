//
//  sc_listener_client_sampleAppDelegate.h
//  sc_listener_client_sample
//
//  Created by Jared Kells on 10/02/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class sc_listener_client_sampleViewController;

@interface sc_listener_client_sampleAppDelegate : NSObject <UIApplicationDelegate> {
	UIWindow *window;
	NSTimer* timer;
    sc_listener_client_sampleViewController *viewController;
}
@property (nonatomic, retain) NSTimer* timer;
@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet sc_listener_client_sampleViewController *viewController;

@end

