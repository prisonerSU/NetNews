//
//  HXHomeVC.m
//  HX-网易新闻
//
//  Created by honey on 2017/3/10.
//  Copyright © 2017年 栉一. All rights reserved.
//

#import "HXHomeVC.h"
#import <YYModel.h>
#import "HXChannelModel.h"

@interface HXHomeVC ()

//频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *ChannelScrollView;

//新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *NewsCollectionView;

//新闻布局对象
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *NewsFlowLayout;

@end

@implementation HXHomeVC

#pragma mark ----初始化
- (void)viewDidLoad {
    [super viewDidLoad];


    //获取频道数据
    [self requestChannelData];
}

#pragma mark ----获取json频道数据
- (void)requestChannelData {
    
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
    
    for (HXChannelModel *model in modelArray) {
        
        NSLog(@"%@",model);
    }

}

@end
