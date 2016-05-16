//
//  SYCustomTable.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYCustomTable.h"
@interface SYCustomTable()
@property (assign) CustomTableType tableType;
@property (strong, nonatomic) NSArray *traks;
@property (strong, nonatomic) NSArray *history;
@end
@implementation SYCustomTable

@synthesize cs_delegate;

-(void)setData:(NSArray *)data forTableViewType:(CustomTableType)type {
    self.delegate = self;
    self.dataSource = self;
    self.tableType = type;
    if (self.tableType == CustomTableType_Search || self.tableType == CustomTableType_Detail) {
        self.traks = data;
    }
    else {
        self.history = data;
    }
    
    [self reloadData];
    [self scrollRectToVisible:CGRectMake(0, 0, 1, 1) animated:YES];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tableType == CustomTableType_Search) {
        SYSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYSearchCell" forIndexPath:indexPath];
        [cell mapCellWithModel:self.traks[indexPath.row]];
        return cell;
    }
    else if (self.tableType == CustomTableType_Detail){
        TrackEntity *track = [self.traks firstObject];
        if (indexPath.row == 0) {
            SYImageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYImageCell" forIndexPath:indexPath];
            [cell.image setImageWithURL:[NSURL URLWithString:track.artworkUrl100] usingActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
            return cell;
        }
        else {
            SYDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYDetailCell" forIndexPath:indexPath];
            [cell mapCellWithModel:track andRow:indexPath.row];
            return cell;
        }
    }
    else {
        SYDetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"SYDetailCell" forIndexPath:indexPath];
        HistoryEntity *ent = self.history[indexPath.row];
        [cell.textLabel setText:ent.searchString];
        return cell;
    }
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.tableType == CustomTableType_Search) {
        return 120;
    }
    else if (self.tableType == CustomTableType_Detail){
        if (indexPath.row == 0) {
            return 125;
        }
        else {
            return 56;
        }
    }
    else {
        return 44;
    }
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.tableType == CustomTableType_Search) {
        return  self.traks.count;
    }
    else if (self.tableType == CustomTableType_Detail){
        return 6;
    }
    else {
        return self.history.count;
    }
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    if (self.tableType == CustomTableType_Search) {
        if ([cs_delegate conformsToProtocol:@protocol(CellSeletcted)] && [cs_delegate respondsToSelector:@selector(selectedTrack:)]) {
            TrackEntity * track = self.traks[indexPath.row];
            [cs_delegate selectedTrack:track];
        }
    }
    if (self.tableType == CustomTableType_History) {
        if ([cs_delegate conformsToProtocol:@protocol(CellSeletcted)] && [cs_delegate respondsToSelector:@selector(selectedHistory:)]) {
            HistoryEntity * history = self.history[indexPath.row];
            [cs_delegate selectedHistory:history];
        }
    }
}



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
