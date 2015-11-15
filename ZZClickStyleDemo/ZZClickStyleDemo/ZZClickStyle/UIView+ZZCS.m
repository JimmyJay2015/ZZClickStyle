//
//  UIView+ZZCS.m
//  ZZClickStyleDemo
//
//  Created by Jimmy－zzm on 15/11/15.
//  Copyright © 2015年 Jimmy－zzm. All rights reserved.
//

#import "UIView+ZZCS.h"
#import <objc/runtime.h>

@implementation UIView (ZZCS)


- (void)setZzcs_replaceView:(UIView *)replayView
{
    objc_setAssociatedObject(self, @selector(zzcs_replaceView), replayView, OBJC_ASSOCIATION_RETAIN);
}
- (UIView *)zzcs_replaceView
{
    return objc_getAssociatedObject(self, _cmd);
}


- (void)shake
{
    // 将view画成背景
    UIGraphicsBeginImageContext(self.bounds.size);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    [self.layer renderInContext:ctx];
    UIImage* tImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    self.zzcs_replaceView = [[UIImageView alloc] initWithImage:tImage];
    self.zzcs_replaceView.frame = self.frame;
    [self.superview addSubview:self.zzcs_replaceView];
    [self setHidden:YES];
    
    CGRect currentRect = self.zzcs_replaceView.frame;
    
    // 抖动的frame 变大->变小->还原
    CGRect frame0 = currentRect;
    
    CGRect frame1 = currentRect;
    frame1.origin.x = currentRect.origin.x - 5;
    frame1.origin.y = currentRect.origin.y - 5;
    frame1.size.height = currentRect.size.height + 10;
    frame1.size.width = currentRect.size.width + 10;

    CGRect frame2 = currentRect;
    frame2.origin.x = currentRect.origin.x + 5;
    frame2.origin.y = currentRect.origin.y + 5;
    frame2.size.height = currentRect.size.height - 10;
    frame2.size.width = currentRect.size.width - 10;
    
    CGRect frame3 = currentRect;
    
    CGRect frame4 = currentRect;
    frame4.origin.x = currentRect.origin.x - 2.5;
    frame4.origin.y = currentRect.origin.y - 2.5;
    frame4.size.height = currentRect.size.height + 5;
    frame4.size.width = currentRect.size.width + 5;
    
    CGRect frame5 = currentRect;
    frame5.origin.x = currentRect.origin.x + 2.5;
    frame5.origin.y = currentRect.origin.y + 2.5;
    frame5.size.height = currentRect.size.height - 5;
    frame5.size.width = currentRect.size.width - 5;
    
    CGRect frame6 = currentRect;
    
    CAKeyframeAnimation *keyAnima = [CAKeyframeAnimation animation];
    keyAnima.keyPath = @"bounds";
    keyAnima.beginTime = CACurrentMediaTime();
    
    NSValue *v0 = [NSValue valueWithCGRect:frame0];
    NSValue *v1 = [NSValue valueWithCGRect:frame1];
    NSValue *v2 = [NSValue valueWithCGRect:frame2];
    NSValue *v3 = [NSValue valueWithCGRect:frame3];
    NSValue *v4 = [NSValue valueWithCGRect:frame4];
    NSValue *v5 = [NSValue valueWithCGRect:frame5];
    NSValue *v6 = [NSValue valueWithCGRect:frame6];

    keyAnima.values = @[v0, v1,v2, v3, v4, v5, v6];
    keyAnima.removedOnCompletion = YES;
    keyAnima.fillMode = kCAFillModeForwards;
    keyAnima.duration = 0.2;
    keyAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    keyAnima.delegate = self;
    
    [self.zzcs_replaceView.layer addAnimation:keyAnima forKey:@"shake"];
}

- (void)animationDidStart:(CAAnimation *)anim
{
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag
{
    [self.zzcs_replaceView removeFromSuperview];
    self.zzcs_replaceView = nil;
    [self setHidden:NO];
}


@end
