//
//  HistoryEntity.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "HistoryEntity.h"

@implementation HistoryEntity

// Insert code here to add functionality to your managed object subclass
-(void)setPropertiesWithDictionary:(NSDictionary *)dict{
    self.searchString = dict[@"searchString"];
}
@end
