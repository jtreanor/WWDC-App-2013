//
//  JTTimeLineLayout.m
//  WWDCApp
//
//  Created by James Treanor on 30/04/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import "JTTimeLineLayout.h"
#import "JTTimelineDecoration.h"

#define kTimeLineItemSize 136
#define kEnlargedItemWidth 870
#define kEnlargedItemHeight 620

#define kEnlargedScaleWidth 870/136
#define kEnlargedScaleHeight 620/136

#define kLineDecoration @"line"



@implementation JTTimeLineLayout

-(id)init {
    self = [super init];
    if (self) {
        self.itemSize = CGSizeMake(kTimeLineItemSize, kTimeLineItemSize);
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        self.sectionInset = UIEdgeInsetsMake(200, 400.0, 200, 260);
                    
        [self registerClass:[JTTimelineDecoration class] forDecorationViewOfKind:kLineDecoration];
    }
    return self;
}

-(void)setTappedIndexPath:(NSIndexPath *)tappedIndexPath {
    _previousIndexPath = _tappedIndexPath;
    _tappedIndexPath = tappedIndexPath;
}

-(CGPoint)currentCenterPoint {
    CGPoint center = self.collectionView.center;
    
    center.x += self.collectionView.contentOffset.x;
    
    return center;
}

-(UICollectionViewLayoutAttributes*)layoutAttributesForSupplementaryViewOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    return [super layoutAttributesForSupplementaryViewOfKind:kind atIndexPath:indexPath];
}

-(UICollectionViewLayoutAttributes*)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind atIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *layoutAttributes = [UICollectionViewLayoutAttributes layoutAttributesForDecorationViewOfKind:decorationViewKind withIndexPath:indexPath];
    layoutAttributes.frame = CGRectMake(-kDecorationOffset, 0.0, self.collectionViewContentSize.width + kDecorationOffset, self.collectionViewContentSize.height);
    layoutAttributes.zIndex = -1;
    return layoutAttributes;
}

-(UICollectionViewLayoutAttributes*)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    UICollectionViewLayoutAttributes *attributes = [super layoutAttributesForItemAtIndexPath:indexPath];
    
    CGPoint center = attributes.center;

    
    
    NSInteger cellsInSection = [self.collectionView numberOfItemsInSection:indexPath.section];
    
    NSInteger yDirection = (indexPath.row % 2 == 0 ? -1 : 1);
    
    //Move based on number of cells in the section
    switch (cellsInSection) {
        case 1: //Tapadoo
            yDirection = 0;
            center.x += 105;
            center.y = [self currentCenterPoint].y;
            break;
        case 2: //About Me
            center.y += 125 * yDirection;
            center.x += 50;
            break;
        case 4: //My Apps
            
            if (indexPath.row == 0 || indexPath.row == 1) {
                center.y += 120 * yDirection;
                center.x -= 140;
            } else {
                center.y += 125 * yDirection;

            }
            break;
            
        default:
            break;
    }
    
    //re-align bottom cells
    if (yDirection == 1) { //if at bottom
        center.y -= 10;
    }
    
    attributes.center = center;
    
    
    
    if ([indexPath isEqual:_tappedIndexPath]) {
        if (_isFullyTransformed) {
            attributes.size = CGSizeMake(kEnlargedItemWidth, kEnlargedItemHeight);
        } else {
            attributes.transform3D = CATransform3DMakeScale(6, 4.5, 1.0);
        }
        
        attributes.center = [self currentCenterPoint];
        attributes.zIndex = 1;
    } else if ([indexPath isEqual:_previousIndexPath]) {
        if (!_isFullyTransformed) {
            attributes.transform3D = CATransform3DMakeScale(0.1, 0.2, 1.0);
        }
        
        attributes.zIndex = 1;
    }
    
    
    
    
    return attributes;
}


-(NSArray*)layoutAttributesForElementsInRect:(CGRect)rect {
    // Get all the attributes for the elements in the specified frame
    NSMutableArray *allAttributesInRect = [[super
                                    layoutAttributesForElementsInRect:rect] mutableCopy];
    NSMutableArray *returnAttributes = [@[] mutableCopy];
    
    [allAttributesInRect addObject:[self layoutAttributesForDecorationViewOfKind:kLineDecoration atIndexPath:[NSIndexPath indexPathForItem:0 inSection:0]]];
    
    for (UICollectionViewLayoutAttributes *cellAttributes in allAttributesInRect)
    {
        if (cellAttributes.representedElementKind == UICollectionElementKindSectionHeader) {
            [returnAttributes addObject:[self layoutAttributesForSupplementaryViewOfKind:UICollectionElementKindSectionHeader atIndexPath:cellAttributes.indexPath]];
        } else if (cellAttributes.representedElementCategory == UICollectionElementCategoryDecorationView) {
            [returnAttributes addObject:[self layoutAttributesForDecorationViewOfKind:kLineDecoration atIndexPath:cellAttributes.indexPath]];
        } else if (cellAttributes.representedElementCategory == UICollectionElementCategoryCell) {
            [returnAttributes addObject:[self layoutAttributesForItemAtIndexPath:cellAttributes.indexPath]];
        }
    }
    return returnAttributes;
}

@end
