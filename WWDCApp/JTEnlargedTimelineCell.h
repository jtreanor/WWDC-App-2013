//
//  JTEnlargedTimelineCell.h
//  WWDCApp
//
//  Created by James Treanor on 01/05/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTTimeLineItem.h"

#define kCellDeflatenotification @"cellDeflate"

@interface JTEnlargedTimelineCell : UICollectionViewCell

-(void)reset;

@property(strong,nonatomic) UIImageView *cellImageView;
@property(strong,nonatomic) UILabel *titleLabel;
@property(strong,nonatomic) UITextView *textView;
@property(strong,nonatomic) UIImageView *sideImageView;

@end
