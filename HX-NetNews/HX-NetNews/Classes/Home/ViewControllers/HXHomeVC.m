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
#import "ChannelLabel.h"

@interface HXHomeVC ()

//频道视图
@property (weak, nonatomic) IBOutlet UIScrollView *ChannelScrollView;

//新闻视图
@property (weak, nonatomic) IBOutlet UICollectionView *NewsCollectionView;

//新闻布局对象
@property (weak, nonatomic) IBOutlet UICollectionViewFlowLayout *NewsFlowLayout;

//频道数据
@property (nonatomic,strong) NSArray *channelModelArray;


@end

@implementation HXHomeVC

#pragma mark ----初始化
- (void)viewDidLoad {
    [super viewDidLoad];


    self.automaticallyAdjustsScrollViewInsets = NO;
    //获取频道数据
    [self requestChannelData];
}

#pragma mark ----获取json频道数据
- (void)requestChannelData {
    
//    //获取文件路径
//    NSString *jsonPath = [[NSBundle mainBundle]pathForResource:@"topic_news.json" ofType:nil];
//    
//    //获取文件对应的二进制数据
//    NSData *jsonData = [NSData dataWithContentsOfFile:jsonPath];
//    
//    //反序列化json数据
//    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:jsonData options:0 error:NULL];
//    
//    //获取对应的频道数组字典数据
//    NSArray *ChannelDictArray = [dict objectForKey:@"tList"];
//    
//    //使用YYModel完成字典转模型的操作
//    NSArray *modelArray = [NSArray yy_modelArrayWithClass:[HXChannelModel class] json:ChannelDictArray];
//    
//    for (HXChannelModel *model in modelArray) {
//        
//        NSLog(@"%@",model);
//    }
    
    //将频道数据存放到数组中
    self.channelModelArray = [HXChannelModel getChannelModelArray];
    
//    NSLog(@"%@",self.channelModelArray);
    
    //根据频道数据 创建对应的label
    CGFloat labelWidth = 80;
    CGFloat labelHeight = 44;
    
    //遍历频道数组
    for (int i = 0; i < self.channelModelArray.count; i++) {
        
        //获取对应的模型数据
        HXChannelModel *model = self.channelModelArray[i];
        
        //根据模型数据 创建label
        ChannelLabel *label = [[ChannelLabel alloc]initWithFrame:CGRectMake(i * labelWidth, 0, labelWidth, labelHeight)];
        
        //设置频道数据
        label.text = model.tname;
        
        //设置文字大小和居中方式
        label.font = [UIFont systemFontOfSize:15];
        label.textAlignment = NSTextAlignmentCenter;
        
        label.backgroundColor = [UIColor colorWithRed:arc4random_uniform(265)/255.0 green:arc4random_uniform(265)/255.0 blue:arc4random_uniform(265)/255.0 alpha:1];
        
        //添加
        [self.ChannelScrollView addSubview:label];
        
    }
    //设置scrollview的滚动大小
    self.ChannelScrollView.contentSize = CGSizeMake(labelWidth * self.channelModelArray.count, 0);
    
    //不显示垂直和水平方向的滚动指示器
    self.ChannelScrollView.showsVerticalScrollIndicator = NO;
    self.ChannelScrollView.showsHorizontalScrollIndicator = NO;


}


@end
