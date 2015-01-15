//
// Created by Ian Dundas on 15/01/15.
// Copyright (c) 2015 Ian Dundas. All rights reserved.
//

@import UIKit;

@interface UIView (bezier)
- (void)drawDotAtPoint:(CGPoint)point withColor:(UIColor *)color;
- (void)drawPath:(UIBezierPath *)path;
@end