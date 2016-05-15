//
//  SYDetailController.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYDetailController.h"

@interface SYDetailController ()
@property (weak, nonatomic) IBOutlet SYCustomTable *detailedTable;
@end

@implementation SYDetailController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationController setTitle:self.track.trackName];
    [self.detailedTable setData:[NSArray arrayWithObject:self.track] forTableViewType:CustomTableType_Detail];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
