//
//  GetPostListener.h
//  测试app
//
//  Created by mac on 2019/5/27.
//  Copyright © 2019 xlapp. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@protocol GetPostListener <NSObject>

-(void) onGetText:(NSString*) text;



@end

NS_ASSUME_NONNULL_END
