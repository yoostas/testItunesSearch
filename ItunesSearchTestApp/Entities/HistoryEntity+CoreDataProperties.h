//
//  HistoryEntity+CoreDataProperties.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "HistoryEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface HistoryEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *searchString;

@end

NS_ASSUME_NONNULL_END
