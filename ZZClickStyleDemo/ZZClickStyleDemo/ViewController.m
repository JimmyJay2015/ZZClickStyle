//
//  ViewController.m
//  ZZClickStyleDemo
//
//  Created by Jimmy－zzm on 15/11/15.
//  Copyright © 2015年 Jimmy－zzm. All rights reserved.
//

#import "ViewController.h"
#import "UIView+ZZCS.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    CGRect screenSize = [UIScreen mainScreen].bounds;
    
    UIButton *buttonTest1 = [[UIButton alloc] initWithFrame:CGRectMake((screenSize.size.width - 200)/2, 100, 200, 40)];
    buttonTest1.backgroundColor = [UIColor redColor];
    [buttonTest1 setTitle:@"click me and shake" forState:UIControlStateNormal];
    buttonTest1.layer.cornerRadius = 5.;
    
    [self.view addSubview:buttonTest1];
    
    [buttonTest1 addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)clicked:(id)sender
{
    UIView *target = (UIView *)sender;
    
    [target shake];
}

@end
