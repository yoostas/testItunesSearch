//
//  SYLocalDataManager.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYLocalDataManager.h"
#import "SYBaseEntity.h"
@interface SYLocalDataManager()
@property (strong, nonatomic) NSManagedObjectContext *context;
@end
@implementation SYLocalDataManager
+(SYLocalDataManager *) sharedManager {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
    });
    return shared;
}

-(instancetype) initUniqueInstance {
    AppDelegate *app = [[UIApplication sharedApplication]delegate];
    self.context = app.managedObjectContext;
    return [super init];
}

-(NSArray*) selectAllEntities:(NSString *)entityName {
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSError *error = nil;
    NSArray *fetched = [self.context executeFetchRequest:fetch error:&error];
    if (fetched) {
        return fetched;
    }
    return [NSArray new];
}

-(NSArray *) selectWithQuery:(NSString *)query arguments:(NSArray *)args forEntity:(NSString *)entityName {
    NSFetchRequest *fetch = [NSFetchRequest fetchRequestWithEntityName:entityName];
    NSPredicate *predicate = [NSPredicate predicateWithFormat:query argumentArray:args];
    fetch.predicate = predicate;
    NSError *error = nil;
    NSArray *fetched = [self.context executeFetchRequest:fetch error:&error];
    if (fetched && !error) {
        return fetched;
    }
    return [NSArray new];
}

-(SYBaseEntity *)insertObject:(NSString *)name {
    return [NSEntityDescription insertNewObjectForEntityForName:name inManagedObjectContext:self.context];
}
-(BOOL)insertObject:(NSDictionary *)obj withEntityName:(NSString *)name {
    SYBaseEntity *newEntity = [self insertObject:name];
    [newEntity setPropertiesWithDictionary:obj];
    NSError *error = nil;
    BOOL saved = [self.context save:&error];
    if (saved) {
        return YES;
    }
    else {
        return NO;
    }
}
-(BOOL)insertAllFromArray:(NSArray *)array withEntityName:(NSString *)name {
    NSArray *filtered = array;
    NSArray *newData = [array copy];
    if (newData) {
        filtered = [self getUniqueEntities:newData andEntityName:name];
    }
    for (int i = 0; i < [filtered count]; i++) {
        NSDictionary *item = filtered[i];
        if (item) {
            SYBaseEntity *newEntity = [self insertObject:name];
            [newEntity setPropertiesWithDictionary:item];
        }
    }
    NSError *error = nil;
    BOOL saved = [self.context save:&error];
    if (saved) {
        return YES;
    }
    else {
        return NO;
    }
    
}

-(NSArray*) getUniqueEntities:(NSArray *)newData andEntityName:(NSString *)name {
    BOOL isNew;
    NSMutableArray *filtered = [NSMutableArray new];
    NSArray *all = [self selectAllEntities:name];
    for (int i = 0; i < [newData count]; i++) {
        isNew = YES;
        for (int j = 0; j < [all count]; j++) {
            NSDictionary *newdic = newData[i];
            if (newdic) {
                NSNumber *newID = [newdic objectForKey:@"trackId"];
                if (newID) {
                    NSNumber *oldID = [(TrackEntity *)all[j] trackId];
                    if (newID == oldID) {
                        isNew = NO;
                        continue;
                    }
                }
            }
        }
        if (isNew) {
            [filtered addObject:newData[i]];
        }
    }
    return filtered;
}
@end