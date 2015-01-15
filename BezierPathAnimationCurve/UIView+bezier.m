//
// Created by Ian Dundas on 15/01/15.
// Copyright (c) 2015 Ian Dundas. All rights reserved.
//

#import "UIView+bezier.h"

// private class extension
@interface UIView (bezier)

@end

@implementation UIView (bezier)
-(void)drawDotAtPoint:(CGPoint)point withColor:(UIColor*)color{

    UIView *dot = [[UIView alloc] initWithFrame:CGRectMake (point.x-2, point.y-2, 4, 4)];
    [dot setBackgroundColor:color];
    [self addSubview:dot];
}
-(void)drawPath:(UIBezierPath *)path{
    // Drawing the path
    CAShapeLayer *layer = [CAShapeLayer layer];
    layer.path          = path.CGPath;
    layer.strokeColor   = [UIColor colorWithRed:0.13 green:0.51 blue:0.97 alpha:1].CGColor;
    layer.lineWidth     = 3.0;
    layer.fillColor     = nil;

    [self.layer addSublayer:layer];
}

@end