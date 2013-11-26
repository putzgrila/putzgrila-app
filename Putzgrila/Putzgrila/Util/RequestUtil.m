//
//  RequestUtil.m
//  Putzgrila
//
//  Created by Gabriel Martins on 26/10/13.
//
//

#import "RequestUtil.h"

@implementation RequestUtil

+ (NSString *) getParameter:(NSURLRequest *) request parameterName:(NSString  *)parameterName
{
    NSString *string = request.URL.query;
    NSArray *parameters = [string componentsSeparatedByString: @"&"];
    
    for(NSString *parameter in parameters)
    {
        if([parameter rangeOfString:parameterName].location != NSNotFound)
        {
            NSArray *parameterValue = [parameter componentsSeparatedByString:@"="];
            return [parameterValue objectAtIndex:1];
        }
    }
    
   // NSLog(@"Parameter not found, %@, %@", parameterName, request.URL.absoluteString);
    
    return @"";
}

@end
