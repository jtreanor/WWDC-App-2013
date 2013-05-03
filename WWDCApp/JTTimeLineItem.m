//
//  JTTimeTableItem.m
//  
//
//  Created by James Treanor on 02/05/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "JTTimeLineItem.h"

@implementation JTTimeLineItem

@synthesize descriptionText;
@synthesize imageName;
@synthesize title;
@synthesize detailImageName;

+ (JTTimeLineItem *)instanceFromDictionary:(NSDictionary *)aDictionary {

    JTTimeLineItem *instance = [[JTTimeLineItem alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {

    if ([key isEqualToString:@"description"]) {
        [self setValue:value forKey:@"descriptionText"];
    } else {
        [super setValue:value forUndefinedKey:key];
    }

}


@end
