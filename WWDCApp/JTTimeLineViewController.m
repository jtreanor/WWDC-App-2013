//
//  JTTimeLineViewController.m
//  WWDCApp
//
//  Created by James Treanor on 30/04/2013.
//  Copyright (c) 2013 James Treanor. All rights reserved.
//

#import "JTTimeLineViewController.h"
#import "JTTimeLineLayout.h"
#import "JTTimeLineCell.h"
#import "JTTimeLineSection.h"
#import "JTEnlargedTimelineCell.h"
#import <QuartzCore/QuartzCore.h>
#import "JTTimeLineItem.h"
#import "JTHeader.h"

#define kTimelineReuseCell @"timeLineCell"
#define kTimelineEnlargedcell @"enlargedCell"
#define kHeader @"header"

@interface JTTimeLineViewController ()

@property(nonatomic,strong) NSArray *timeLineSections;

@end

@implementation JTTimeLineViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(id)initWithSections:(NSArray*)items  ForLayout:(UICollectionViewLayout*)layout{
    self = [super initWithCollectionViewLayout:layout];
    if (self) {
        _timeLineSections = items;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[JTTimeLineCell class] forCellWithReuseIdentifier:kTimelineReuseCell];
    [self.collectionView registerClass:[JTEnlargedTimelineCell class] forCellWithReuseIdentifier:kTimelineEnlargedcell];
    [self.collectionView registerClass:[JTHeader class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:kHeader];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(handleTapGesture:)];
    [self.collectionView addGestureRecognizer:tap];
    
    [self.collectionView setAllowsSelection:YES];
}

-(UICollectionViewCell*)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
     JTTimeLineLayout *layout = (JTTimeLineLayout*)self.collectionView.collectionViewLayout;
    
    JTTimeLineItem *item = [[_timeLineSections[indexPath.section] items] objectAtIndex:indexPath.row];
    
    if ([indexPath isEqual:[layout tappedIndexPath]]) {
        JTEnlargedTimelineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTimelineEnlargedcell forIndexPath:indexPath];
        
        [[cell cellImageView] setImage:[UIImage imageNamed:item.imageName]];
        [[cell sideImageView] setImage:[UIImage imageNamed:item.detailImageName]];
        [[cell titleLabel] setText:item.title];
        [[cell textView] setText:item.descriptionText];
        
        [cell reset];
        
        return cell;
    } else {
        JTTimeLineCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kTimelineReuseCell forIndexPath:indexPath];
        
        [[cell cellImageView] setImage:[UIImage imageNamed:item.imageName]];
        
        
        return cell;
    }
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    JTTimeLineSection *tSection = _timeLineSections[section];
    return [tSection.items count];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return [_timeLineSections count];
}


-(UICollectionReusableView*)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    JTHeader *h = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:kHeader forIndexPath:indexPath];
    
    JTTimeLineSection *tSection = _timeLineSections[indexPath.section];
    
    [h.headerLabel setText:tSection.section];
    
    return h;
}

- (void)handleTapGesture:(UITapGestureRecognizer *)sender {
    CGPoint tapPoint = [sender locationInView:self.collectionView];
    
    JTTimeLineLayout *layout = (JTTimeLineLayout*)self.collectionView.collectionViewLayout;
    
    NSIndexPath *tappedIndexPath = [self.collectionView indexPathForItemAtPoint:tapPoint];
    
    
    if (tappedIndexPath != nil && [tappedIndexPath isEqual:layout.tappedIndexPath]) {
        tappedIndexPath = nil;
        [[NSNotificationCenter defaultCenter] postNotificationName:kCellDeflatenotification object:nil];
    }
    
    [self.collectionView performBatchUpdates:^{
        [layout setIsFullyTransformed:NO];
        [layout setTappedIndexPath:tappedIndexPath];
        //Disable scroll if item selected
        [self.collectionView setScrollEnabled:(tappedIndexPath == nil)];
    } completion:^(BOOL finished) {
        [layout setIsFullyTransformed:YES];
        [self.collectionView reloadData];
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
