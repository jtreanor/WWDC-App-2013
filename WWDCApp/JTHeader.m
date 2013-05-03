//
//  JTHeader.m
//  WWDCApp
//
//  Created by James Treanor on 01/05/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import "JTHeader.h"

@implementation JTHeader

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setBackgroundColor:[UIColor whiteColor]];
        _headerLabel = [[UILabel alloc] initWithFrame:self.bounds];
        [_headerLabel setBackgroundColor:[UIColor clearColor]];
        [_headerLabel setTextAlignment:NSTextAlignmentCenter];
        [_headerLabel setFont:[UIFont boldSystemFontOfSize:35.0]];
        _headerLabel.numberOfLines = 0;
        _headerLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:_headerLabel];
        
    }
    return self;
}


@end
