//
//  JTTimeLineCell.m
//  WWDCApp
//
//  Created by James Treanor on 01/05/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import "JTTimeLineCell.h"
#import <QuartzCore/QuartzCore.h>

@implementation JTTimeLineCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self.contentView setBackgroundColor:[UIColor clearColor]];
        _cellImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [self.contentView addSubview:_cellImageView];
    }
    return self;
}

@end
