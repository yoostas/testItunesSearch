//
//  SYMainController.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYMainController.h"
#import "SYDetailController.h"
@interface SYMainController ()
@property (weak, nonatomic) IBOutlet SYCustomTable *mainSearchTable;
@property (weak, nonatomic) IBOutlet UISearchBar *mainSearch;
@property (strong,nonatomic) SYNetworking *netManager;
@property (weak, nonatomic) IBOutlet SYCustomTable *historyTable;

@property (weak, nonatomic) IBOutlet UIView *darkView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *historyTableHeight;
@property (strong,nonatomic) NSArray *historySearch;

@end

@implementation SYMainController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.netManager = [SYNetworking sharedNetworking];
    [self.darkView setHidden:YES];
    [self.navigationController setTitle:@"Поиск треков"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.historySearch = [[SYLocalDataManager sharedManager] selectAllEntities:SYHistoryEntity];
    [self hideHistoryView];
    if ([self.historySearch count]>0) {
        [self.historyTable setData:self.historySearch forTableViewType:CustomTableType_History];
    }
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cellTaped:) name:searchCellTap object:nil];
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(cellTaped:) name:historyCellTap object:nil];
}

-(void)viewWillDisappear:(BOOL)animated {
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    [self.view endEditing:YES];
    [self hideHistoryView];
    [self.mainSearchTable setUserInteractionEnabled:YES];
    [self.darkView setHidden:YES];
    if (self.historySearch.count >0) {
        NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF.searchString like %@", searchBar.text];
        NSArray *filteredArray = [self.historySearch filteredArrayUsingPredicate:pred];
        if (filteredArray.count == 0) {
            [[SYLocalDataManager sharedManager] insertObject:@{@"searchString":searchBar.text} withEntityName:SYHistoryEntity];
        }
    }
    else {
        [[SYLocalDataManager sharedManager] insertObject:@{@"searchString":searchBar.text} withEntityName:SYHistoryEntity];
    }
    [self.netManager seafchForString:searchBar.text withSuccessCallBack:^(NSArray *response) {
        [self.mainSearchTable setData:response forTableViewType:CustomTableType_Search];
    } ofFailureCallBack:^(NSError *error) {
        [self errorHandle:error];
    }];
}


-(BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    if (self.historySearch.count >0) {
        [self.darkView setHidden:NO];
        [self showHistoryView];
        [self.historyTable setHidden:NO];
        
    }
    return YES;
}

-(void)showHistoryView {
    [UIView animateWithDuration:5 animations:^{
        self.historyTableHeight.constant = 100;
    } completion:^(BOOL finished) {
        if (finished) {
            
        }
    }];
}

-(void)hideHistoryView {
    [self.historyTable setHidden:YES];
    [UIView animateWithDuration:5 animations:^{
        self.historyTableHeight.constant = 0;
    }];
}

-(void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {
    [self hideHistoryView];
    [self.view endEditing:YES];
}

-(void)cellTaped:(NSNotification *)notification {
    if ([notification.name isEqualToString:searchCellTap]) {
        TrackEntity *track = notification.userInfo[@"entity"];
        [self performSegueWithIdentifier:@"toDetails" sender:track];
    }
    if ([notification.name isEqualToString:historyCellTap]) {
        HistoryEntity *history = notification.userInfo[@"entity"];
        [self.mainSearch setText:history.searchString];
        [self.darkView setHidden:YES];
        [self.mainSearchTable setUserInteractionEnabled:YES];
        [self searchBarSearchButtonClicked:self.mainSearch];
        [self hideHistoryView];
    }
}

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"toDetails"]) {
        SYDetailController *dc = [segue destinationViewController];
        dc.track = sender;
    }
}


@end