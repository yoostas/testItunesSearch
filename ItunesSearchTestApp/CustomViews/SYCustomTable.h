//
//  SYCustomTable.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TrackEntity.h"
#import "HistoryEntity.h"
@protocol CellSeletcted

-(void)selectedTrack:(TrackEntity *)track;
-(void)selectedHistory:(HistoryEntity *)history;

@end

typedef enum {
    CustomTableType_Search  = 0,
    CustomTableType_Detail  = 1,
    CustomTableType_History = 2,
}CustomTableType;

@interface SYCustomTable : UITableView<UITableViewDelegate,UITableViewDataSource>
-(void) setData:(NSArray *)data forTableViewType:(CustomTableType) type;

@property (nonatomic, weak) NSObject <CellSeletcted> *cs_delegate;

@end
