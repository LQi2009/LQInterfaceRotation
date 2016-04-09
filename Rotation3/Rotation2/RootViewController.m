//
//  RootViewController.m
//  Rotation2
//
//  Created by Artron_LQQ on 16/4/7.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "RootViewController.h"
#import "FirstViewController.h"
#import "SecondViewController.h"
#import "BaseNavigation.h"

NSString *InterfaceOrientation = @"InterfaceOrientation";    //旋转屏幕的通知
@interface RootViewController ()
{
    BOOL shouldAutorotate;
}
@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    FirstViewController *first = [[FirstViewController alloc]init];
    BaseNavigation *nav1 = [[BaseNavigation alloc]initWithRootViewController:first];
    nav1.tabBarItem.title = @"aaaa";
    
    SecondViewController *second = [[SecondViewController alloc]init];
    BaseNavigation *nav2 = [[BaseNavigation alloc]initWithRootViewController:second];
    nav2.tabBarItem.title = @"bbbbb";
    
    
    self.viewControllers = @[nav1,nav2];
    
    
    //注册旋转屏幕的通知
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(AutorotateInterface:) name:InterfaceOrientation object:nil];

}

/**
 *  旋转屏幕的通知
 *
 *  @param notifition 通知传递的参数
 */
-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}

-(void)AutorotateInterface:(NSNotification *)notifition
{
    shouldAutorotate = [notifition.object boolValue];
}

/**
 *
 *  @return 是否支持旋转
 */
-(BOOL)shouldAutorotate
{
    NSLog(@"======%d",shouldAutorotate);
    
    NSLog(@"%@",NSStringFromClass([[self getCurrentRootViewController]class]));
    NSLog(@">>>>%@",[self aaa]);
    
    return [[self aaa] shouldAutorotate];
    if (!shouldAutorotate) {
        return NO;
    }else{
        return YES;
    }
    return YES;
}

/**
 *  适配旋转的类型
 *
 *  @return 类型
 */
-(UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    
    if (!shouldAutorotate) {
        return UIInterfaceOrientationMaskPortrait;
    }
    return UIInterfaceOrientationMaskAllButUpsideDown;
}

- (UIViewController*)aaa {
    BaseNavigation *navi = [self.viewControllers objectAtIndex:self.selectedIndex];
    
    return [navi.viewControllers lastObject];
}

- (UIViewController *)getCurrentRootViewController {
    
//    CommonTool *tool = [[CommonTool alloc]init];
    
    UIViewController *result;
    UIWindow *topWindow = [[UIApplication sharedApplication] keyWindow];
    
    if (topWindow.windowLevel != UIWindowLevelNormal){
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows){
            if (topWindow.windowLevel == UIWindowLevelNormal)
                break;
        }
    }
    
    UIView *rootView = [topWindow subviews].firstObject;
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isMemberOfClass:[UIViewController class]]){
        result = nextResponder;
    }
    else if ([nextResponder isMemberOfClass:[UITabBarController class]] | [nextResponder isMemberOfClass:[UINavigationController class]]){
        result = [self findViewController:nextResponder];
    }
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil){
        result = topWindow.rootViewController;
    }
    
    else{
//        NSAssert(NO, @"找不到顶端VC");
    }
    return result;
}

- (UIViewController *)findViewController:(id)controller{
    if ([controller isMemberOfClass:[UINavigationController class]]) {
        return [self findViewController:[(UINavigationController *)controller visibleViewController]];
    }
    else if ([controller isMemberOfClass:[UITabBarController class]]){
        return [self findViewController:[(UITabBarController *)controller selectedViewController]];
    }
    else if ([controller isKindOfClass:[UIViewController class]]){
        return controller;
    }
    else{
//        NSAssert(NO, @"找不到顶端VC");
        return nil;
    }
}

//获取当前屏幕显示的viewcontroller
- (UIViewController *)getCurrentVC
{
    UIViewController *result = nil;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] firstObject];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    
    return result;
}

// 获取当前处于activity状态的view controller
- (UIViewController *)activityViewController
{
    UIViewController* activityViewController = nil;
    
    UIWindow *window = [[UIApplication sharedApplication] keyWindow];
    if(window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow *tmpWin in windows)
        {
            if(tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    NSArray *viewsArray = [window subviews];
    if([viewsArray count] > 0)
    {
        UIView *frontView = [viewsArray objectAtIndex:0];
        
        id nextResponder = [frontView nextResponder];
        
        if([nextResponder isKindOfClass:[UIViewController class]])
        {
            activityViewController = nextResponder;
        }
        else
        {
            activityViewController = window.rootViewController;
        }
    }
    
    return activityViewController;
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
