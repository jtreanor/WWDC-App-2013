//
//  JTEnlargedTimelineCell.m
//  WWDCApp
//
//  Created by James Treanor on 01/05/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import "JTEnlargedTimelineCell.h"
#import <QuartzCore/QuartzCore.h>

#define kFinalImageRect CGRectMake(30,30,90,90)
#define kTitleLabelRect CGRectMake(200,30, 500, 90)
#define kTextViewRect CGRectMake(30, 175, 500, 420)
#define kSideImageViewRect CGRectMake(560,175,270,420)

@interface JTEnlargedTimelineCell ()

@property(nonatomic,strong) UIImageView *backgroundImageView;

@end

@implementation JTEnlargedTimelineCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {        
        [self setBackgroundColor:[UIColor clearColor]];
        
        _backgroundImageView = [[UIImageView alloc] initWithFrame:self.contentView.bounds];
        [_backgroundImageView setImage:[UIImage imageNamed:@"popout"]];
        [self.contentView addSubview:_backgroundImageView];
        
        _titleLabel = [[UILabel alloc] initWithFrame:kTitleLabelRect];
        [_titleLabel setFont:[UIFont boldSystemFontOfSize:40.0f]];
        [_titleLabel setBackgroundColor:[UIColor clearColor]];
        [_titleLabel setTextColor:[UIColor whiteColor]];
        [_titleLabel setAlpha:0.0];
        [_titleLabel setNumberOfLines:0];
        [self.contentView addSubview:_titleLabel];
        
        _textView = [[UITextView alloc] initWithFrame:kTextViewRect];
        [_textView setBackgroundColor:[UIColor clearColor]];
        [_textView setFont:[UIFont systemFontOfSize:19.0f]];
        [_textView setTextColor:[UIColor whiteColor]];
        [_textView setEditable:NO];
        [_textView setAlpha:0.0];
        [self.contentView addSubview:_textView];
        
        _sideImageView = [[UIImageView alloc] initWithFrame:kSideImageViewRect];
        [_sideImageView setContentMode:UIViewContentModeScaleAspectFit];
        [_sideImageView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_sideImageView];
        
        _cellImageView = [[UIImageView alloc] initWithFrame:self.bounds];
        [_cellImageView setBackgroundColor:[UIColor clearColor]];
        [self.contentView addSubview:_cellImageView];
        
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(restoreSize) name:kCellDeflatenotification object:nil];
    }
    return self;
}

-(void)restoreSize {
    [UIView animateWithDuration:0.15 animations:^{
        [_textView setAlpha:0.0];
        [_titleLabel setAlpha:0.0];
        [_sideImageView setAlpha:0.0];
        [_cellImageView setFrame:self.bounds];
    }];
}

-(void)reset {
    [_textView setAlpha:0.0];
    [_titleLabel setAlpha:0.0];
    [_sideImageView setAlpha:0.0];
    [_cellImageView setFrame:self.bounds];
    
    [UIView animateWithDuration:0.6
                          delay:0
                        options:0
                     animations:^{
                         _cellImageView.frame = kFinalImageRect;
                         _titleLabel.alpha = 1.0;
                         _textView.alpha = 1.0;
                         _sideImageView.alpha = 1.0;
                     }completion:^(BOOL finished) {
                         
                     }];
}

@end
