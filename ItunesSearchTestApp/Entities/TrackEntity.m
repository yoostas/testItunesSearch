//
//  TrackEntity.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "TrackEntity.h"

@implementation TrackEntity

-(void)setPropertiesWithDictionary:(NSDictionary *)dict{
    self.trackId            = dict[@"trackId"];
    self.artworkUrl100      = dict[@"artworkUrl100"];
    self.artworkUrl30       = dict[@"artworkUrl30"];
    self.artworkUrl60       = dict[@"artworkUrl60"];
    self.trackName          = dict[@"trackName"];
    self.releaseDate        = dict[@"releaseDate"];
    self.artistId           = dict[@"artistId"];
    self.artistName         = dict[@"artistName"];
    self.collectionName     = dict[@"collectionName"];
    self.primaryGenreName   = dict[@"primaryGenreName"];
}
@end
