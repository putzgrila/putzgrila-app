//
//  NativeBridgeUrlProtocol.m
//  Putzgrila
//
//  Created by Gabriel Martins on 26/10/13.
//
//

#import "NativeBridgeUrlProtocol.h"
#import "NativeBridgeInterceptor.h"

#define URL_MATCH(ORIGINAL_URL, URL) [ORIGINAL_URL.absoluteString rangeOfString:URL].location != NSNotFound

@implementation NativeBridgeUrlProtocol

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
    if([NativeBridgeInterceptor shouldInterceptRequest:[request URL]])
    {
        return true;
    }
    else if([[[request URL] scheme] isEqualToString:@"log"] )
    {
        return true;
    }
    else if([[[request URL] scheme] isEqualToString:@"statusbar"] )
    {
        if([[[request URL] absoluteString] isEqualToString:@"statusbar:true"])
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];

        else
            [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];

        return false;
    }
    
    return false;
}

+ (NSURLRequest *)canonicalRequestForRequest:(NSURLRequest *)request
{
    return request;
}

- (void)startLoading
{
    id<NSURLProtocolClient> client = [self client];
    
    NSURLRequest* request = [self request];

    OfflineResponse* offlineResponse;
    
    if([NativeBridgeInterceptor shouldInterceptRequest:[request URL]])
    {
        offlineResponse = [NativeBridgeInterceptor processRequest:request];
        if(offlineResponse==nil)
        {
            offlineResponse = [[OfflineResponse alloc] init];
            [offlineResponse setStatusCode:200];
        }
    }
    else if([[[request URL] scheme] isEqualToString:@"log"] ) {
        NSLog(@"%@", [[request URL] absoluteString]);
        offlineResponse = [[OfflineResponse alloc] init];
        [offlineResponse setStatusCode:200];
    }

    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:request.URL 
                                                             statusCode:offlineResponse.statusCode 
                                                             HTTPVersion:@"HTTP/1.1" 
                                                             headerFields:offlineResponse.headers];

    [client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [client URLProtocol:self didLoadData:offlineResponse.data];
    [client URLProtocolDidFinishLoading:self];    
}

- (void)stopLoading
{
}

@end

