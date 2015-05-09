//
//  ContainerDismissButton.m
//  Portfolio
//
//  Created by Eddie Kaiger on 4/14/15.
//  Copyright (c) 2015 EddieKaiger. All rights reserved.
//

#import "ContainerDismissButton.h"

@implementation ContainerDismissButton

- (id)initWithCoder:(NSCoder *)aDecoder {
    
    self = [super initWithCoder:aDecoder];
    if (self) {
        self.backgroundColor = [self buttonBackgroundColor];
        self.layer.masksToBounds = NO;
        [self configureDownArrow];
    }
    
    return self;
}

- (void)layoutSubviews {
    
    [super layoutSubviews];
    
    CGFloat cornerRadius = self.frame.size.height / 2.0f;
    self.layer.cornerRadius = cornerRadius;
}

- (void)configureDownArrow {
    
    /*** BEHOLD, THE CREATION OF THE AMAZING DOWN-ARROW ***/
    
    const CGFloat thickness = 3;
    const CGFloat shapeSize = 25;
    const CGFloat shift = 17;
    
    /*
     We need to create 6 points that will create the outline
     for an L-shaped polygon. Once it's done, we rotate it and
     center it inside of our button.
     */
    
    CGPoint points[6];
    points[0] = CGPointMake(0, 0);
    points[1] = CGPointMake(points[0].x + shapeSize, points[0].y);
    points[2] = CGPointMake(points[0].x + shapeSize, points[0].y + thickness);
    points[3] = CGPointMake(points[0].x + thickness, points[0].y + thickness);
    points[4] = CGPointMake(points[0].x + thickness, points[0].y + shapeSize);
    points[5] = CGPointMake(points[0].x, points[0].y + shapeSize);
    
    // Create path via a few C-based conversions
    CGMutablePathRef cgPath = CGPathCreateMutable();
    CGPathAddLines(cgPath, &CGAffineTransformIdentity, points, sizeof points / sizeof *points);
    CGPathCloseSubpath(cgPath);
    UIBezierPath *path = [UIBezierPath bezierPathWithCGPath:cgPath];
    
    // Create shape from path, fill, and rotate
    CAShapeLayer *shape = [CAShapeLayer layer];
    shape.path = path.CGPath;
    shape.fillColor = [UIColor whiteColor].CGColor;
    shape.transform = CATransform3DMakeAffineTransform(CGAffineTransformMakeRotation(-(M_PI_2 + M_PI_4)));
    shape.frame = CGRectMake(-(self.frame.size.width / 2.0f), - shift,
                             self.frame.size.width, self.frame.size.height);
    
    [self.layer addSublayer:shape];
}

- (void)setHighlighted:(BOOL)highlighted {
    
    if (highlighted) {
        self.backgroundColor = [UIColor colorWithWhite:1 alpha:0.2];
    } else {
        self.backgroundColor = [self buttonBackgroundColor];
    }
}

- (UIColor *)buttonBackgroundColor {
    return [UIColor clearColor];
}


@end
