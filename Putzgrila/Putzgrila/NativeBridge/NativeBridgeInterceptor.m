#import <Foundation/Foundation.h>

#import "NativeBridgeInterceptor.h"
#import "RequestUtil.h"
#import "PutzgrilaAppDelegate.h"
#import "Facebook.h"

#define URL_MATCH(ORIGINAL_URL, URL) ([ORIGINAL_URL.absoluteString rangeOfString:URL].location != NSNotFound)

@implementation NativeBridgeInterceptor

+ (BOOL)canInitWithRequest:(NSURLRequest *)request
{
    if([[[request URL] scheme] isEqualToString:@"log"] )
    {
        return true;
    }
    else if([[[request URL] scheme] isEqualToString:@"tbk"] )
    {
        return true;
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
    //PutzgrilaAppDelegate *appDelegate = (PutzgrilaAppDelegate*)[[UIApplication sharedApplication] delegate];
    
    NSData *data = nil;
    
    if (URL_MATCH(request.URL, @"openFacebookLogin"))
    {
        [self performSelectorOnMainThread:@selector(doFbLogin) withObject:nil waitUntilDone:NO];
    }
    
    NSDictionary *headerFields = @{ @"ETag" : @"12345678" };
    NSHTTPURLResponse *response = [[NSHTTPURLResponse alloc] initWithURL:request.URL
                                                              statusCode:200
                                                             HTTPVersion:@"HTTP/1.1"
                                   
                                                            headerFields:headerFields];
    
    if(data==nil)
    {
        NSString *value = @"";
        data = [value dataUsingEncoding:NSUTF8StringEncoding];
    }
    
    [client URLProtocol:self didReceiveResponse:response cacheStoragePolicy:NSURLCacheStorageNotAllowed];
    [client URLProtocol:self didLoadData:data];
    [client URLProtocolDidFinishLoading:self];
}

- (void)stopLoading
{
    
}

-(void)doFbLogin
{
    [Facebook openSession];
}

@end
