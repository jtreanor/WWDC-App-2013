//
//  JTTimeLineLayout.h
//  WWDCApp
//
//  Created by James Treanor on 30/04/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JTTimeLineLayout : UICollectionViewFlowLayout

@property(nonatomic,strong) NSIndexPath *tappedIndexPath;
@property(readonly,strong) NSIndexPath *previousIndexPath;

@property(nonatomic,assign) BOOL isFullyTransformed;

@end
