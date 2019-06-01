//
//  HttpTest.h
//  测试app
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 xlapp. All rights reserved.
//

#ifndef HttpTest_h
#define HttpTest_h

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

@protocol GetPostListener
-(void) onGetText:(NSString*) text;



@end

@interface HttpTest : NSObject
-(void)get:(NSString*)urlstring;
-(void)post:(NSString*)urlstring withParam:(NSString*)param;
-(void)postUrl:(NSString*)urltext withParam: (NSString*)param andSetListener: (void(^)(NSString*)) listener ;
-(void)postFanyi:(NSString*)urltext withParam: (NSString*)param andSetListener: (void(^)(NSString*)) callback;
@end





#endif /* HttpTest_h */
