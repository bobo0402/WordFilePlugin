/* 
  WordFilePlugin.h
  GRPW

  Created by admin on 14-3-19.

*/

#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
#import <Cordova/CDVPlugin.h>

@interface WordFilePlugin : CDVPlugin
    
    @property (nonatomic, copy) NSString* callbackID;
    // Instance Method
+ (NSArray *)getTraffic;    
- (void) exportJjyxbg:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options;
- (void)getTraffic:(CDVInvokedUrlCommand *)command;
//- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller;
//- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller previewItemAtIndex:(NSInteger)index;
@end