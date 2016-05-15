//
//  SYBaseEntity.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import <CoreData/CoreData.h>

@interface SYBaseEntity : NSManagedObject
-(void) setPropertiesWithDictionary:(NSDictionary *) dict;
@end
