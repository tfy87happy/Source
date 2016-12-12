//
//  ViewController.m
//  ButtonClickCompletion
//
//  Created by feiyang.tang on 2016/12/12.
//  Copyright © 2016年 feiyang. All rights reserved.
//

#import "ViewController.h"
#import "UIControl+ClickCompletion.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setFrame:CGRectMake(50, 150, 200, 45)];
    [btn setTitle:@"Test" forState:UIControlStateNormal];
    [btn setBackgroundColor:[UIColor lightGrayColor]];
    [self.view addSubview:btn];
    [btn clickWithEvent:UIControlEventTouchUpInside completion:^(id sender) {
        NSLog(@"点击按钮成功回调");
    }];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
