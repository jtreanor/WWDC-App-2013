//
//  JTTimeTableSection.m
//  
//
//  Created by James Treanor on 02/05/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import "JTTimeLineSection.h"

#import "JTTimeLineItem.h"

@implementation JTTimeLineSection

@synthesize items;
@synthesize section;

+ (JTTimeLineSection *)instanceFromDictionary:(NSDictionary *)aDictionary {

    JTTimeLineSection *instance = [[JTTimeLineSection alloc] init];
    [instance setAttributesFromDictionary:aDictionary];
    return instance;

}

- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary {

    if (![aDictionary isKindOfClass:[NSDictionary class]]) {
        return;
    }

    [self setValuesForKeysWithDictionary:aDictionary];

}

- (void)setValue:(id)value forKey:(NSString *)key {

    if ([key isEqualToString:@"items"]) {

        if ([value isKindOfClass:[NSArray class]]) {

            NSMutableArray *myMembers = [NSMutableArray arrayWithCapacity:[value count]];
            for (id valueMember in value) {
                JTTimeLineItem *populatedMember = [JTTimeLineItem instanceFromDictionary:valueMember];
                [myMembers addObject:populatedMember];
            }

            self.items = myMembers;

        }

    } else {
        [super setValue:value forKey:key];
    }

}


@end
