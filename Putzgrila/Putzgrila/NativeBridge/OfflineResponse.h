//
//  OfflineResponse.h
//  Putzgrila
//
//  Created by Gabriel Martins on 26/10/13.
//
//

#import <Foundation/Foundation.h>

@interface OfflineResponse : NSObject

@property (nonatomic, strong) NSData *data;
@property (nonatomic, strong) NSDictionary *headers;
@property (nonatomic) NSInteger statusCode;

@end
