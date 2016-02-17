//
//  PartnerAPIManager.m
//  CharlyBackend
//
//  Created by o on 2016-02-12.
//  Copyright © 2016 Charly. All rights reserved.
//

#import "PartnerAPIManager.h"

@implementation PartnerAPIManager

+ (PartnerAPIManager*)sharedInstance{
    static PartnerAPIManager *sharedMyManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedMyManager = [[self alloc] init];
    });
    return sharedMyManager;
}

+ (void)initializeWithBaseURL:(NSString *)baseURL{
    NSLog(@"here let this work");
}

- (AFHTTPRequestOperation *)getPartnersWithCompletionHandler:
(void (^)(AFHTTPRequestOperation *operation, NSDictionary  *responseObject)) completionHandler
                                                     onError:
(void (^)(AFHTTPRequestOperation *operation, NSError *error)) errorHandler{
    
    NSString *strURL = @"http://ec2-54-164-248-76.compute-1.amazonaws.com/partner";
    
    return [self GET:strURL parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        
        if(![responseObject isKindOfClass:[NSDictionary class]] || ![responseObject[@"subscriptionBucket"] isKindOfClass:[NSArray class]])
        {
            if(errorHandler != nil)
            {
                NSLog(@"error retrieving partners");
            }
            return;
        }
        
        NSDictionary *response = (NSDictionary *)responseObject;
        
        if(completionHandler){
            completionHandler(operation, response);
        }
        
    } failure:errorHandler];
    
}


@end
