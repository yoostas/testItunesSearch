//
//  SYDetailCell.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SYDetailCell : UITableViewCell
-(void)mapCellWithModel:(TrackEntity *)track andRow:(NSInteger)row;
@end
