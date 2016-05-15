//
//  SYSearchCell.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYSearchCell.h"

@interface SYSearchCell ()
@property (weak, nonatomic) IBOutlet UIImageView *searchImage;
@property (weak, nonatomic) IBOutlet UILabel *artistNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *albumNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *singleNameLabel;
@end

@implementation SYSearchCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    // Configure the view for the selected state
}

-(void)mapCellWithModel:(TrackEntity *)model{
    NSURL *artWorkImageUrl = [NSURL URLWithString:model.artworkUrl100];
    NSString *albumName = model.collectionName;
    NSString *artistName = model.artistName;
    NSString *trackName = model.trackName;
    [self.artistNameLabel setText:artistName];
    [self.albumNameLabel setText:albumName];
    [self.singleNameLabel setText:trackName];
    if (artWorkImageUrl) {
        [self.searchImage setImageWithURL:artWorkImageUrl usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    }
}
@end
