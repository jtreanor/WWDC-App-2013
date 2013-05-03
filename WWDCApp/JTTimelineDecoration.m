//
//  JTTimelineDecoration.m
//  WWDCApp
//
//  Created by James Treanor on 02/05/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import "JTTimelineDecoration.h"
#import <QuartzCore/QuartzCore.h>

@implementation JTTimelineDecoration

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImage *backgroundImage = [UIImage imageNamed:@"jamesBG"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:backgroundImage];
        [imageView setContentMode:UIViewContentModeCenter];
        imageView.image = backgroundImage;
        [self addSubview:imageView];
    }
    return self;
}


@end
