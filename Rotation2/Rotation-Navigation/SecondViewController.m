//
//  SecondViewController.m
//  Rotation-Navigation
//
//  Created by Artron_LQQ on 16/4/6.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "SecondViewController.h"
#import "BaseNaviViewController.h"

@interface SecondViewController ()

@end

@implementation SecondViewController

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
//    if ([[UIDevice currentDevice] respondsToSelector:@selector(setOrientation:)]) {
//        SEL selector = NSSelectorFromString(@"setOrientation:");
//        NSInvocation *invocation = [NSInvocation invocationWithMethodSignature:[UIDevice instanceMethodSignatureForSelector:selector]];
//        [invocation setSelector:selector];
//        [invocation setTarget:[UIDevice currentDevice]];
//        int val = UIInterfaceOrientationLandscapeRight;
//        [invocation setArgument:&val atIndex:2];//前两个参数已被target和selector占用
//
//        [invocation invoke];
//    }
    
//    // 状态栏动画持续时间
//    CGFloat duration = [UIApplication sharedApplication].statusBarOrientationAnimationDuration;
//    [UIView animateWithDuration:duration animations:^{
//        // 修改状态栏的方向及view的方向进而强制旋转屏幕
//        [[UIApplication sharedApplication] setStatusBarOrientation:_bottomView.landscapeModel ? UIInterfaceOrientationLandscapeRight : UIInterfaceOrientationPortrait];
//        self.navigationController.view.transform = _bottomView.landscapeModel ? CGAffineTransformMakeRotation(M_PI_2) : CGAffineTransformIdentity;
//        self.navigationController.view.bounds = CGRectMake(self.navigationController.view.bounds.origin.x, self.navigationController.view.bounds.origin.y, self.view.frame.size.height, self.view.frame.size.width);
//    }];

}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor greenColor];
    
    UIImageView *img = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"40fe711f9b754b596159f3a6.jpg"]];
    img.frame = CGRectMake(10, 40, 100, 300);
    [self.view addSubview:img];
}

////设置样式
//- (UIStatusBarStyle)preferredStatusBarStyle {
//    return UIStatusBarStyleLightContent;
//}
//
//设置是否隐藏
- (BOOL)prefersStatusBarHidden {
//    [super prefersStatusBarHidden];
    return NO;
}
//
////设置隐藏动画
//- (UIStatusBarAnimation)preferredStatusBarUpdateAnimation {
//    return UIStatusBarAnimationNone;
//}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    
    }

-(BOOL)shouldAutorotate
{
    return YES;
    
}

//- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return YES;
//}
//
//
-(NSUInteger)supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
//    return self.orietation;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return UIInterfaceOrientationLandscapeRight;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
    [self dismissViewControllerAnimated:YES completion:nil];
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
