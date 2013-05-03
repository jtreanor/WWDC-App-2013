//
//  JTTimeTableSection.h
//  
//
//  Created by James Treanor on 02/05/2013.
//  Copyright (c) 2013. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JTTimeLineSection : NSObject {
    NSArray *items;
    NSString *section;
}

@property (nonatomic, copy) NSArray *items;
@property (nonatomic, copy) NSString *section;

+ (JTTimeLineSection *)instanceFromDictionary:(NSDictionary *)aDictionary;
- (void)setAttributesFromDictionary:(NSDictionary *)aDictionary;

@end
