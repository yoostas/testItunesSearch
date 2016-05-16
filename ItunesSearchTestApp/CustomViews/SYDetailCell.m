//
//  SYDetailCell.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYDetailCell.h"

@implementation SYDetailCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(void)mapCellWithModel:(TrackEntity *)track andRow:(NSInteger)row{
    switch (row) {
        case 1:
            [self.textLabel setText:@"Artist"];
            [self.detailTextLabel setText:track.artistName];
            break;
        case 2:
            [self.textLabel setText:@"Track name"];
            [self.detailTextLabel setText:track.trackName];
            break;
        case 3:
            [self.textLabel setText:@"Album name"];
            [self.detailTextLabel setText:track.collectionName];
            break;
        case 4:
            [self.textLabel setText:@"Genre"];
            [self.detailTextLabel setText:track.primaryGenreName];
            break;
        case 5:
            [self.textLabel setText:@"Release date"];
            [self.detailTextLabel setText:track.releaseDate];
            break;
            
        default:
            [self.textLabel setText:@""];
            [self.detailTextLabel setText:@""];
            break;
    }
}

@end
