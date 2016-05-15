//
//  SYLocalDataManager.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
@interface SYLocalDataManager : NSObject
+(SYLocalDataManager *) sharedManager;

+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

-(NSArray*)selectAllEntities:(NSString *)entityName;
-(BOOL)insertAllFromArray:(NSArray *)array withEntityName:(NSString *)name;
-(BOOL)insertObject:(NSDictionary *)obj withEntityName:(NSString *)name;
-(NSArray *)selectWithQuery:(NSString *)query arguments:(NSArray *)args forEntity:(NSString *)entityName;
@end
