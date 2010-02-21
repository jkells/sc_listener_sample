//
//  FFTView.h
//  sc_listener_client_sample
//
//  Created by Jared Kells on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCListener.h"

@interface FFTView : UIView {
	double freq_db[kFFTSIZE/2];
	double freq_db_harmonic[kFFTSIZE/2];
}

- (void) updateFreqs:(double*) data data2: (double*) data2;

@end
