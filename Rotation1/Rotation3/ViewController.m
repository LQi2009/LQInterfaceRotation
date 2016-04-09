//
//  ViewController.m
//  Rotation3
//
//  Created by Artron_LQQ on 16/4/9.
//  Copyright © 2016年 Artup. All rights reserved.
//

#import "ViewController.h"
#import "FirstViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

//当前控制器是跟视图控制器,直接重写此方法,设置即可
- (BOOL)shouldAutorotate{
    return NO;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UIWindow *win = [[[UIApplication sharedApplication]delegate]window];
    
    FirstViewController *first = [[FirstViewController alloc]init];
    
    win.rootViewController = first;
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
