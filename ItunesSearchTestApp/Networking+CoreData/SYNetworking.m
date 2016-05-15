//
//  SYNetworking.m
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import "SYNetworking.h"

@interface SYNetworking()
@property (strong, nonatomic) AFHTTPSessionManager *netManager;
@property (strong, nonatomic) SYLocalDataManager *dataManager;

@end

@implementation SYNetworking

#define SEARCH_URL @"https://itunes.apple.com/search"


+(SYNetworking *) sharedNetworking {
    static dispatch_once_t pred;
    static id shared = nil;
    dispatch_once(&pred, ^{
        shared = [[super alloc] initUniqueInstance];
        
    });
    return shared;
}

-(instancetype) initUniqueInstance {
    self.netManager = [AFHTTPSessionManager manager];
    self.dataManager = [SYLocalDataManager sharedManager];
    return [super init];
}

-(void)seafchForString:(NSString *)artistOrTrack withSuccessCallBack:(void (^)(NSArray *response))success ofFailureCallBack:(void (^)(NSError *error))failure {
    
    NSDictionary *parameters = @{@"term": artistOrTrack};
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    [self.netManager GET:SEARCH_URL parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        NSArray *response = responseObject[@"results"];
        NSDictionary *first = [response firstObject];
        NSNumber *artistID = first[@"artistId"];
        if ([self.dataManager insertAllFromArray:response withEntityName:SYTrackEntity]) {
            if (artistID) {
                response = [self.dataManager selectWithQuery:@"artistId == %@" arguments:@[artistID] forEntity:SYTrackEntity];
            }
            else{
                response = [self.dataManager selectAllEntities:SYTrackEntity];
            }
            success(response);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
        failure(error);
    }];
    
    
}

@end
