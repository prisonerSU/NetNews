//
//  HXChannelModel.m
//  HX-网易新闻
//
//  Created by honey on 2017/3/10.
//  Copyright © 2017年 栉一. All rights reserved.
//

#import "HXChannelModel.h"
#import <YYModel.h>

@implementation HXChannelModel


#pragma mark ----类方法快速获取数据
+(NSArray *)getChannelModelArray {
    
    //获取文件路径
    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
    
    //获取文件对应的二进制数据
    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
    
    //反序列化json数据
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
    
    //获取对应的频道数组字典数据
    NSArray *ChannelDictArray = [dict objectForKey:@"tList"];
    
    //使用YYModel完成字典转模型的操作
    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[HXChannelModel class] json:ChannelDictArray];
  
    //  根据模型里面的tid进行从小到大的排序
    modelArray = [modelArray sortedArrayUsingComparator:^NSComparisonResult(HXChannelModel *obj1, HXChannelModel *obj2) {
        
        //  默认使用升序,如果想要降序,那么需要把参数掉转就可以了,比如:[obj2.tid compare:obj1.tid];
        return [obj1.tid compare:obj2.tid];
    }];
    return modelArray;
}

#pragma mark ----将数据转化
- (NSString *)description {
    
    NSString *desc = [NSString stringWithFormat:@"%@-%@", self.tid, self.tname];
    
    return desc;
}


@end
