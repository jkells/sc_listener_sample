//
//  sc_listener_client_sampleViewController.h
//  sc_listener_client_sample
//
//  Created by Jared Kells on 10/02/10.
//  Copyright __MyCompanyName__ 2010. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFTView.h"

@interface sc_listener_client_sampleViewController : UIViewController {
	FFTView *fft_view;
	UILabel *peak_power_label;
	UILabel *average_power_label;
	UILabel *freq_label;
}

@property (nonatomic, retain) IBOutlet FFTView *fft_view;
@property (nonatomic, retain) IBOutlet UILabel* peak_power_label;
@property (nonatomic, retain) IBOutlet UILabel* average_power_label;
@property (nonatomic, retain) IBOutlet UILabel* freq_label;

@end

