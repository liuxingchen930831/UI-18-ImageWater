//
//  ViewController.m
//  图片水印demo
//
//  Created by liuxingchen on 16/10/25.
//  Copyright © 2016年 Liuxingchen. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIImage *image = [UIImage imageNamed:@"小黄人"];
    /*
     size:图片的size
     opaque: YES:不透明 NO:透明 
     scale:通常不需要缩放上下文，取值为0，表示不缩放
     */
    //1.开启位图上下文,位图上下文和view无关，不需要在drawRect上绘制
    UIGraphicsBeginImageContextWithOptions(image.size, NO, 0);
    //2.绘制原生的图片
    [image drawAtPoint:CGPointZero];
    //3.给图片添加水印
    NSString *str = @"LXC";
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[NSForegroundColorAttributeName] = [UIColor blueColor];
    dict[NSFontAttributeName] = [UIFont systemFontOfSize:25];
    [str drawAtPoint:CGPointMake(200, 528) withAttributes:dict];
    
    //4.生成一张图片，从上下文中获取图片
    UIImage *imageWater = UIGraphicsGetImageFromCurrentImageContext();
    self.imageView.image = imageWater;
    
    //5.用完关闭上下文
    UIGraphicsEndImageContext();
}
@end
