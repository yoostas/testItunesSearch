//
//  SYNetworking.h
//  ItunesSearchTestApp
//
//  Created by Stanislav on 5/15/16.
//  Copyright © 2016 Stanislav. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
@interface SYNetworking : NSObject

+(SYNetworking *) sharedNetworking;

+(instancetype) alloc __attribute__((unavailable("alloc not available, call sharedInstance instead")));
-(instancetype) init __attribute__((unavailable("init not available, call sharedInstance instead")));
+(instancetype) new __attribute__((unavailable("new not available, call sharedInstance instead")));

-(void)seafchForString:(NSString *)artistOrTrack withSuccessCallBack:(void (^)(NSArray *response))success ofFailureCallBack:(void (^)(NSError *error))failure;
@end
