//
//  ThirdViewController.m
//  Rotation2
//
//  Created by Artron_LQQ on 16/4/7.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ThirdViewController.h"
#import "FourViewController.h"

@interface ThirdViewController ()
{
    BOOL isPotrait; //判断当前屏幕是否横竖屏
}
@end

@implementation ThirdViewController

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    FourViewController *four = [[FourViewController alloc]init];
    
    [self presentViewController:four animated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor grayColor];
}

#pragma - rotate
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"InterfaceOrientation" object:@"YES"];
    
    [self orientationToPortrait:UIInterfaceOrientationLandscapeRight];
}
- (void)didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
    
    isPotrait = !isPotrait;
    
    if (isPotrait) {
        self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    }else {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
}

- (void)viewDidDisappear:(BOOL)animated {
    [super viewDidDisappear:animated];
    
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationNone];
    [[NSNotificationCenter defaultCenter]postNotificationName:@"InterfaceOrientation" object:@"NO"];
    
}
//强制旋转屏幕
- (void)orientationToPortrait:(UIInterfaceOrientation)orientation {
    SEL selector = NSSelectorFromString(@"setOrientation:");
    NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
    [invocation setSelector:selector];
    [invocation setTarget:[UIDevice currentDevice]];
    int val = orientation;
    [invocation setArgument:&val atIndex:2];//前两个参数已被target和selector占用
    [invocation invoke];
    
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
