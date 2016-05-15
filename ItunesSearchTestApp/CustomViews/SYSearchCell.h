//
//  SYSearchCell.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackEntity.h"

@interface SYSearchCell : UITableViewCell
-(void) mapCellWithModel:(TrackEntity *)model;
@end
