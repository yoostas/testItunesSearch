//
//  TrackEntity+CoreDataProperties.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

#import "TrackEntity.h"

NS_ASSUME_NONNULL_BEGIN

@interface TrackEntity (CoreDataProperties)

@property (nullable, nonatomic, retain) NSString *artworkUrl100;
@property (nullable, nonatomic, retain) NSString *artworkUrl30;
@property (nullable, nonatomic, retain) NSString *artworkUrl60;
@property (nullable, nonatomic, retain) NSNumber *artistId;
@property (nullable, nonatomic, retain) NSString *artistName;
@property (nullable, nonatomic, retain) NSString *collectionName;
@property (nullable, nonatomic, retain) NSString *primaryGenreName;
@property (nullable, nonatomic, retain) NSNumber *trackId;
@property (nullable, nonatomic, retain) NSString *trackName;
@property (nullable, nonatomic, retain) NSString *releaseDate;

@end

NS_ASSUME_NONNULL_END
