//
//  SecondViewController.m
//  FullScreenSlideBack
//
//  Created by crystal on 15/8/11.
//  Copyright (c) 2015年 crystal. All rights reserved.
//

#import "SecondViewController.h"

@interface SecondViewController ()<UIGestureRecognizerDelegate>

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
//获取系统自带滑动手势的target对象
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
//    创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
//    设置手势代理，拦截手势触发
    pan.delegate = self;
//    给导航控制器的view添加全屏滑动手势
    [self.navigationController.view addGestureRecognizer:pan];
//    禁止使用系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}

- (void)handleNavigationTransition:(UIPanGestureRecognizer *)panGesture
{
    
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
//    注意：只用非根控制器才有滑动返回功能，根控制器没有
//    判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.navigationController.childViewControllers.count == 1)
    {
        //表示用户在根控制器界面，就不需要触发滑动手势
        return NO;
    }
    return YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
