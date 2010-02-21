//
//  FFTView.m
//  sc_listener_client_sample
//
//  Created by Jared Kells on 21/02/10.
//  Copyright 2010 __MyCompanyName__. All rights reserved.
//

#import "FFTView.h"

// View to draw the spectrun.

@implementation FFTView

- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}

static const float MAXDB =	1000;
static const float MAXFREQ = 1000;
static const float MINFREQ = 0;

- (void)drawFreq:(float) freq db: (float) db{
	if(freq > MAXFREQ)
		return;
	if(freq < MINFREQ)
		return;
	
	if(db > MAXDB)
		db = MAXDB;
	
	float line_x = (freq - MINFREQ) / ( MAXFREQ - MINFREQ ) * [self frame].size.width;
	float line_height = db / MAXDB * [self frame].size.height;
	
	CGContextRef ctx = UIGraphicsGetCurrentContext();
	CGContextMoveToPoint(ctx, line_x, [self frame].size.height);
	CGContextAddLineToPoint( ctx, line_x, [self frame].size.height - line_height);
	CGContextStrokePath(ctx);
}


- (void)drawRect:(CGRect)rect {
	for(int i = 0; i < kFFTSIZE / 5; i++){
		CGContextRef ctx = UIGraphicsGetCurrentContext();

		CGContextSetRGBStrokeColor(ctx, 0, 1.0, 0, 0.8);
		[self drawFreq: i * kSAMPLERATE / kFFTSIZE db: freq_db_harmonic[i]];

		CGContextSetRGBStrokeColor(ctx, 1.0, 0, 0, 0.8);
		[self drawFreq: i * kSAMPLERATE / kFFTSIZE db: freq_db[i]];

	}
}

- (void) updateFreqs:(double*) data data2: (double*) data2{
	for(int i = 0; i < kFFTSIZE / 2; i++){
		freq_db[i] = data[i];
		freq_db_harmonic[i] = data2[i];
	}
}

- (void)dealloc {
    [super dealloc];
}


@end
