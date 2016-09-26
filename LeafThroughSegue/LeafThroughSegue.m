//
//  LeafThroughSegue.m
//  LeafThroughSegue
//
//  Created by NSSimpleApps on 08.06.15.
//  Copyright (c) 2015 NSSimpleApps. All rights reserved.
//

#import "LeafThroughSegue.h"

@interface LeafThroughSegue() <CAAnimationDelegate>

@end

@implementation LeafThroughSegue

- (void)perform {
    
    UIViewController *sourceController = self.sourceViewController;
    UIViewController *destinationController = self.destinationViewController;
    
    
    CATransition *animation = [CATransition animation];
    animation.delegate = self;
    animation.duration = 0.7;
    animation.timingFunction = UIViewAnimationCurveEaseInOut;
    animation.type = @"pageCurl";
    animation.subtype = kCATransitionFromRight;
    animation.fillMode = kCAFillModeBackwards;
    animation.removedOnCompletion = YES;
    
    [sourceController.view.layer addSublayer:destinationController.view.layer];
    
    [destinationController.view setNeedsUpdateConstraints];
    [sourceController.view.layer addAnimation:animation forKey:@"pageCurlAnimation"];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
    UIViewController *sourceController = self.sourceViewController;
    UIViewController *destinationController = self.destinationViewController;
    [sourceController.navigationController pushViewController:destinationController animated:NO];
}

@end
