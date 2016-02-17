//
//  PartnerAPIManager.h
//  CharlyBackend
//
//  Created by o on 2016-02-12.
//  Copyright © 2016 Charly. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"

@interface PartnerAPIManager : AFHTTPRequestOperationManager

+ (PartnerAPIManager*)sharedInstance;
+ (void)initializeWithBaseURL:(NSString *)baseURL;

- (AFHTTPRequestOperation *)getPartnersWithCompletionHandler:(void (^)(AFHTTPRequestOperation *operation, NSDictionary *responseObject))
completionHandler
                                                     onError:(void (^)(AFHTTPRequestOperation *operation, NSError *error))errorHandler;



@end
