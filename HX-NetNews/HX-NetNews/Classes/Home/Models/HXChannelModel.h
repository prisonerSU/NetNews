//
//  HXChannelModel.h
//  HX-网易新闻
//
//  Created by honey on 2017/3/10.
//  Copyright © 2017年 栉一. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HXChannelModel : NSObject

//频道id
@property (nonatomic,copy)NSString *tid;

//频道名称
@property (nonatomic,copy)NSString *tname;

//类方法快速获取模型数据
+(NSArray *)getChannelModelArray;

@end
