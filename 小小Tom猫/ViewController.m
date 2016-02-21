//
//  ViewController.m
//  小小Tom猫
//
//  Created by qingyun on 16/2/19.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ViewController.h"
#define Resourcepath(name,type) [[NSBundle mainBundle]pathForResource:name ofType:type]
#define ImageWithPath(path) [UIImage imageWithContentsOfFile:path]
@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *tomimage;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    }
//启动动画
- (void)startAnimationWithImageName:(NSString*)imageName andImageCount:(NSInteger)imageCount{
    if ([_tomimage isAnimating]) {
        return;
    }
    NSMutableArray* CLarray = [NSMutableArray array];
    for (int i = 0; i <imageCount; i++) {
#if 0
        NSString* imageName = [NSString stringWithFormat:@"cymbal_%02d.jpg",i];
        UIImage* image = [UIImage imageNamed:imageName];
#else
        NSString* CLarrayN = [NSString stringWithFormat:@"%@_%02d",imageName,i];
        NSString* path = Resourcepath(CLarrayN, @"jpg");
        UIImage* image = ImageWithPath(path);
#endif
        [CLarray addObject:image];
    }
    //设置fireView的帧动画数组
    _tomimage.animationImages = CLarray;
    //设置动画时间
    _tomimage.animationDuration = 0.09 * imageCount;
    //设置动画的重复次数
    _tomimage.animationRepeatCount = 1;
    //开始动画
    [_tomimage startAnimating];
    //回收帧动画的内存
#if 0
    [self performSelector:@selector(clearMemory) withObject:nil afterDelay:_tomimage.animationDuration];
#else
    [_tomimage performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:_tomimage.animationDuration];
#endif

}
//清除帧动画缓存
- (void)clearMemory{
    _tomimage.animationImages = nil;
}
- (IBAction)cymbal:(UIButton *)sender {
    switch (sender.tag) {
        case 1:
            [self startAnimationWithImageName:@"cymbal" andImageCount:13];
            break;
        case 2:
            [self startAnimationWithImageName:@"drink" andImageCount:81];
            break;
        case 3:
            [self startAnimationWithImageName:@"eat" andImageCount:40];
            break;
        case 4:
            [self startAnimationWithImageName:@"fart" andImageCount:28];
            break;
        case 5:
            [self startAnimationWithImageName:@"scratch" andImageCount:56];
            break;
        case 6:
            [self startAnimationWithImageName:@"pie" andImageCount:24];
            break;
        case 7:
            [self startAnimationWithImageName:@"knockout" andImageCount:81];
            break;
        case 8:
            [self startAnimationWithImageName:@"stomach" andImageCount:34];
            break;
        case 9:
            [self startAnimationWithImageName:@"footRight" andImageCount:30];
            break;
        case 10:
            [self startAnimationWithImageName:@"footLeft" andImageCount:30];
            break;
        case 11:
            [self startAnimationWithImageName:@"angry" andImageCount:26];
            break;

        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
