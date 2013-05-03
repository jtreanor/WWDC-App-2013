//
//  JTTimeTableItem.h
//  
//
//  Created by James Treanor on 02/05/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTTimeLineItem : NSObject {
    NSString *descriptionText;
    NSString *imageName;
    NSString *title;
    NSString *detailImageName;
}

@property (nonatomic, copy) NSString *descriptionText;
@property (nonatomic, copy) NSString *imageName;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *detailImageName;

+ (JTTimeLineItem *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
