//
//  ViewController.m
//  BezierPathAnimationCurve
//
//  Created by Ian Dundas on 14/01/15.
//  Copyright (c) 2015 Ian Dundas. All rights reserved.
//


#import "ViewController.h"
#import "UIView+bezier.h"

@interface ViewController ()
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor orangeColor]];

    CGPoint point1 = CGPointMake (100, 350);
    CGPoint point2 = CGPointMake (200, 200);

    UIBezierPath *leapPath = [self bezierPathLeapFrom:point1 to:point2];
    [self.view drawPath:leapPath];

    UIView *animateSquare = [[UIView alloc] initWithFrame:CGRectMake (point1.x-5, point1.y-5, 10, 10)];
    [animateSquare setBackgroundColor:[UIColor purpleColor]];
    [self.view addSubview:animateSquare];

    // The animation
    CAKeyframeAnimation *animation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    // Use this path as the animation's path (casted to CGPath)
    animation.path = leapPath.CGPath;

    // The other animations properties
    animation.fillMode              = kCAFillModeForwards;
    animation.removedOnCompletion   = NO;
    animation.duration              = 1.0;
    animation.timingFunction        = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];

    // Apply it
    [animateSquare.layer addAnimation:animation forKey:@"animation.trash"];
}


-(UIBezierPath *)bezierPathLeapFrom:(CGPoint)point1 to:(CGPoint)point2{

    [self.view drawDotAtPoint:point1 withColor:[UIColor blueColor]];
    [self.view drawDotAtPoint:point2 withColor:[UIColor blueColor]];

    CGPoint controlPoint1 = CGPointMake(point1.x-10, point1.y-200);
    [self.view drawDotAtPoint:controlPoint1 withColor:[UIColor redColor]];

    CGPoint controlPoint2 = CGPointMake(point2.x-50, point2.y-150);
    [self.view drawDotAtPoint:controlPoint2 withColor:[UIColor yellowColor]];

    UIBezierPath *path1 = [UIBezierPath bezierPath];

    [path1 setLineWidth:3.0];
    [path1 moveToPoint:point1];
    [path1 addCurveToPoint:point2 controlPoint1:controlPoint1 controlPoint2:controlPoint2];

    // alternatively:
//    [path1 addQuadCurveToPoint:point2 controlPoint:CGPointMake (100, 50)];

    /* Can extend to add another path: */
//    CGPoint point3 = CGPointMake(200, 50);
//    CGPoint controlPoint3 = CGPointMake(200, commonY);
//    CGPoint controlPoint3 = CGPointMake(point2.x-100, point2.y-100);
//    [self.view drawDotAtPoint:controlPoint3 withColor:[UIColor greenColor]];
//    CGPoint controlPoint4 = CGPointMake(250, 75);
//    UIBezierPath *path2 = [UIBezierPath bezierPath];
//    [path2 setLineWidth:3.0];
//    [path2 moveToPoint:point2];
//    [path2 addCurveToPoint:point3 controlPoint1:controlPoint3 controlPoint2:controlPoint4];

    return path1;
}
@end