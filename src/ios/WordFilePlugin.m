/* 
  WordFilePlugin.m
  GRPW

  Created by admin on 14-3-19.

*/





#import "WordFilePlugin.h"
#import <Foundation/Foundation.h>
#import <QuickLook/QuickLook.h>
#include <arpa/inet.h>
#include <net/if.h>
#include <ifaddrs.h>
#include <net/if_dl.h>
UIWebView *web_view_doc ,*webView;


@implementation WordFilePlugin
    
    @synthesize callbackID;
    

    
    -(void)loadDocument:(NSString*)documentName inView:(UIWebView*) webView{
        NSString *path=[[NSBundle mainBundle] pathForResource:documentName ofType:nil];
        
        NSLog(@"--------------------------------------------------------------------------------------");
        NSLog(@"path = %@",path);
        NSLog(@"--------------------------------------------------------------------------------------");
        
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        
        [webView loadRequest:request];
    }
    
    
    
    -(void)loadDoc:(NSString*)path inView:(UIWebView*) webView{
        //NSString *path=[[NSBundle mainBundle] pathForResource:documentName ofType:nil];
        
        NSLog(@"--------------------------------------------------------------------------------------");
        NSLog(@"path = %@",path);
        NSLog(@"--------------------------------------------------------------------------------------");
        
        NSURL *url = [NSURL fileURLWithPath:path];
        NSURLRequest *request = [NSURLRequest requestWithURL:url];
        [webView loadRequest:request];
        [webView goForward];
        [webView autoresizingMask];
        
        
//        NSThread* myThread = [[NSThread alloc] initWithTarget:self
//                                                     selector:@selector(stop)
//                                                       object:nil];    //[NSThread sleepForTimeInterval:3.0f];
//        [myThread start];
        
        //[web_view goBack];
        NSLog(@"-------1-------------------------------------------------------------------------------");
    }
    
    - (void)stop
    {
        //sleep(3.0f);
        
        [NSThread sleepForTimeInterval:3.0f];
        [self.webView goBack];
        NSLog(@"--------2------------------------------------------------------------------------------");
    }
    
    
    
    -(void)mmi_open_word_document:(NSString*)path{
        [web_view_doc setHidden:NO];
        //[self loadDocument:@"a.doc" inView:web_view];
        
        
        NSLog(@"--------------------------------------------------------------------------------------");
        NSLog(@"string = %@",path);
        NSLog(@"--------------------------------------------------------------------------------------");
//        NSString *documentsDirectory = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents"];
        NSFileManager *fileManager = [NSFileManager defaultManager];
        //NSString *filePath = [self [documentsDirectory stringByAppendingPathComponent:@"xxx.txt"]];
        NSString *filePath = path;
        if(![fileManager fileExistsAtPath:filePath]) //如果不存在
        {
            NSLog(@"xxx.txt is not exist");
//            NSString *dataPath = [[[NSBundle mainBundle] bundlePath] stringByAppendingString:@"/xxx.txt"];//获取程序包中相应文件的路径
            NSError *error;
            NSLog(@"%@",error);
        }else{
            NSLog(@"xxx.txt is exist");
        }
        NSLog(@"--------------------------------------------------------------------------------------");
        [self loadDoc:path inView:web_view_doc];
        
    }

    -(void)btnPressed:(id)sender{
        //UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"123" message:nil delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
        //[alert setBackgroundColor:[UIColor blueColor]];
        //[alert setContentMode:UIViewContentModeScaleAspectFit];
        //[alert show];
        NSLog(@"------------ web ----------------------------------------------------");
        //[web_view setHidden:NO];
        NSLog(@"------------ web ----------------------------------------------------");
        //[self delete:web_view];
        [web_view_doc setHidden:YES];
        //[web_view release];
        //web_view = nil;
        //[self.webView delete:web_view];
        web_view_doc = Nil;
        [web_view_doc release];
        
    }

    -(void)exportJjyxbg:(NSMutableArray*)arguments withDict:(NSMutableDictionary*)options
    {
        
        
        //NSString *str = [arguments objectAtIndex:0];
        //NSString *x = arguments.count;
        //NSString *string = [arguments componentsJoinedByString:@" *** "];
        //int i = arguments.count;
        NSString *string = [arguments objectAtIndex:1];
        
//        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:string
//                                                        message:nil
//                                                        delegate:self
//                                                        cancelButtonTitle:@"cancel"
//                                                        otherButtonTitles:@"ot", nil];
//        [alert setBackgroundColor:[UIColor blueColor]];
//        [alert setContentMode:UIViewContentModeScaleAspectFit];
//        [alert show];
//        NSLog(@"string = %@",string);
        
        if(!web_view_doc){
            NSLog(@"----------------- in if -------------------");
            NSLog(@"string = %@",web_view_doc);
            //CGRect rect = CGRectMake(0,0,320,480);
            
            CGRect rect = [UIScreen mainScreen].bounds;
            if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
               // CGRect rect = [UIScreen mainScreen].bounds;
                
            } else {
                rect = CGRectMake(0,0,rect.size.height,rect.size.width);
                //[img setFrame:(CGRectMake(0, 0, 1440, 784))];
            }
            //rect = CGRectMake(0,0,rect.size.height*0.8,rect.size.width*0.8);

            web_view_doc = [[UIWebView alloc] initWithFrame:rect];
//          [web_view setDelegate:self];
            [web_view_doc setScalesPageToFit:YES];

            //web_view_doc.scrollView.pagingEnabled=YES;
            
            [self.webView addSubview:web_view_doc];
            [web_view_doc setHidden:YES];
            
            //web_view_doc.autoresizingMask = UIViewAutoresizingFlexibleHeight;
            //web_view_doc.scrollView.contentSize=CGSizeMake(rect.size.width, rect.size.height*1.8);
            
        //}
//        [self.self btnPressed:1];
 
        
//////////////////////////////////////////////////////////////
        
        
        
        
        
        
        
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        
        
 
/*
        // 这是classid,在下面的PluginResult进行数据的返回时,将会用到它
        self.callbackID = [arguments pop];
        // 得到Javascript端发送过来的字符串
        NSString *stringObtainedFromJavascript = [arguments objectAtIndex:0];
        // 创建我们要返回给js端的字符串
        NSMutableString *stringToReturn = [NSMutableString stringWithString: @"我是返回的:"];
        [stringToReturn appendString: stringObtainedFromJavascript];
        // Create Plugin Result
        CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString: stringToReturn];
        NSLog(@ "%@",stringToReturn);
        // 检查发送过来的字符串是否等于"HelloWorld",如果不等,就以PluginResult的Error形式返回
        if ([stringObtainedFromJavascript isEqualToString:@"HelloWorld"] == YES){
            // Call the javascript success function
            [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
        } else{
            // Call the javascript error function
            [self writeJavascript: [pluginResult toErrorCallbackString:self.callbackID]];
        }
*/
        
        //[self mmi_open_word_document:string];
//        [self writeJavascript: [pluginResult toSuccessCallbackString:self.callbackID]];
        
        
//////////////////////////////////////////////////////////////////////////////////////////////////////////
        
    //if(!web_view_doc){
        UIButton *Btn;
        CGRect frame;
        Btn = [[UIButton buttonWithType:UIButtonTypeCustom] retain]; //按钮的类型
        //[Btn setImage:[UIImage imageNamed:@“loading001.png”] forState:UIControlStateNormal];//设置按钮图片
        Btn.tag = 10;
        //Btn.alpha = 0.5;
        frame.size.width = 30;  //设置按钮的宽度
        frame.size.height = 30;   //设置按钮的高度
        frame.origin.x = rect.size.width - 20 - 30;   //设置按钮的位置
        frame.origin.y =20;
        [Btn setFrame:frame];
//        [Btn setBackgroundColor:[UIColor blackColor]];
//        [Btn setTitle:@"X" forState:UIControlStateNormal];
//      Btn.titleLabel.font =[UIFont systemFontOfSize:34.0];
        [Btn setImage:[UIImage imageNamed:@"ico_top_close.png"] forState:UIControlStateNormal];
//        Btn.backgroundColor = [UIColor clearColor];
//      [Btn setFont:[UIFont systemFontOfSize:34.0]];
//      [Btn addTarget:self action:@selector(btnPressed:)forControlEvents:UIControlEventTouchUpInside];   //按钮的单击事件
        [Btn addTarget:self action:@selector(btnPressed:)forControlEvents:UIControlEventTouchUpInside];
        [web_view_doc addSubview:Btn];
    }
////////////////////////////////////////////////////////////////////////
        
        
        [self mmi_open_word_document:string];
        
        
    }
    


+ (NSArray *)getTraffic
{
    BOOL   success;
    struct ifaddrs *addrs;
    const struct ifaddrs *cursor;
    const struct if_data *networkStatisc;
    
    int WiFiSent = 0;
    int WiFiReceived = 0;
    int WWANSent = 0;
    int WWANReceived = 0;
    
    NSString *name=[[[NSString alloc]init]autorelease];
    
    success = getifaddrs(&addrs) == 0;
    if (success)
    {
        cursor = addrs;
        while (cursor != NULL)
        {
            name=[NSString stringWithFormat:@"%s",cursor->ifa_name];
            NSLog(@"ifa_name %s == %@\n", cursor->ifa_name,name);
            // names of interfaces: en0 is WiFi ,pdp_ip0 is WWAN
            if (cursor->ifa_addr->sa_family == AF_LINK)
            {
                if ([name hasPrefix:@"en"])
                {
                    networkStatisc = (const struct if_data *) cursor->ifa_data;
                    WiFiSent+=networkStatisc->ifi_obytes;
                    WiFiReceived+=networkStatisc->ifi_ibytes;
                    NSLog(@"WiFiSent %d ==%d",WiFiSent,networkStatisc->ifi_obytes);
                    NSLog(@"WiFiReceived %d ==%d",WiFiReceived,networkStatisc->ifi_ibytes);
                }
                if ([name hasPrefix:@"pdp_ip"])
                {
                    networkStatisc = (const struct if_data *) cursor->ifa_data;
                    WWANSent+=networkStatisc->ifi_obytes;
                    WWANReceived+=networkStatisc->ifi_ibytes;
                    NSLog(@"WWANSent %d ==%d",WWANSent,networkStatisc->ifi_obytes);
                    NSLog(@"WWANReceived %d ==%d",WWANReceived,networkStatisc->ifi_ibytes);
                }
            }
            cursor = cursor->ifa_next;
        }
        freeifaddrs(addrs);
    }
    return [NSArray arrayWithObjects:[NSNumber numberWithInt:WiFiSent], [NSNumber numberWithInt:WiFiReceived],[NSNumber numberWithInt:WWANSent],[NSNumber numberWithInt:WWANReceived], nil];
}

- (void)getTraffic:(CDVInvokedUrlCommand *)command
{
    //NSLog(@"getTraffic:%@", command);
    
    self.callbackID = command.callbackId;
    NSArray *results = [WordFilePlugin getTraffic];
    NSLog(@"getTraffic:%@", results);
    CDVPluginResult* pluginResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsArray:results];
   // [self.commandDelegate sendPluginResult:pluginResult callbackId:[self.callbackID valueForKey:@"successCallBack"]];
    [self writeJavascript:[pluginResult toSuccessCallbackString:self.callbackID]];
    
}
/*//////////////////////////////////
 @interface PreviewDataSource : NSObject<QLPreviewControllerDataSource> {
    NSString *path;
}

@property (nonatomic, assign) NSString *path;

@end
//#import "PreviewDataSource.h"

@implementation PreviewDataSource
@synthesize path;

- (NSInteger) numberOfPreviewItemsInPreviewController: (QLPreviewController *) controller
{
	return 1;
}

- (id <QLPreviewItem>)previewController: (QLPreviewController *)controller previewItemAtIndex:(NSInteger)index
{
	return [NSURL fileURLWithPath:path];
}

- (void)dealloc {
    [path release];
    [super dealloc];
}
@end
*//////////////////////////////

/*
#import "WordFilePlugin.h"
#import <Cordova/CDVPlugin.h>

@implementation WordFilePlugin

//QLPreviewController *qlViewController=nil;




qlViewController = [[QLPreviewController alloc] init];
qlViewController.dataSource = self;
[self presentModalViewController:qlViewController animated:YES];

- (NSInteger)numberOfPreviewItemsInPreviewController:(QLPreviewController *)controller {
    return 1;
}
- (id <QLPreviewItem>)previewController:(QLPreviewController *)controller
                     previewItemAtIndex:(NSInteger)index{
    //-------------读文件
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    if (!documentsDirectory) {
        NSLog(@"Documents directory not found!");//return ;
    }
    NSString *fileName=[NSString stringWithFormat:@"%@.%@",nameQ,extQ];
    NSString *appFile = [documentsDirectory stringByAppendingPathComponent:fileName];
    //-------------
    NSURL *myQLDocument = [NSURL fileURLWithPath:appFile];
    return myQLDocument;
}
*/
    @end

