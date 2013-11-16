//
//  ViewController.m
//  Demonstration
//
//  Created by Robert Ryan on 11/16/13.
//  Copyright (c) 2013 Robert Ryan. All rights reserved.
//

#import "ViewController.h"
#import "UIView+AutoLayout.h"

@interface ViewController ()

@property (nonatomic, weak) UIView *redView;
@property (nonatomic, weak) UIView *blueView;
@property (nonatomic, weak) UIView *greenView;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

    // create three random views

    UIView *view;

    view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    self.redView = view;

    view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view];
    self.blueView = view;

    view = [[UIView alloc] init];
    view.translatesAutoresizingMaskIntoConstraints = NO;
    view.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view];
    self.greenView = view;

    // set blue view size and put it in upper left corner

    [self.blueView addSizeConstraints:CGSizeMake(44.0, 44.0)];
    [self.blueView addLeadingAndTopConstraints:CGPointMake(10.0, 10.0) fromTopLayoutGuideForViewController:self];

    // set red view size and put it in lower right corner

    [self.redView addSizeConstraints:CGSizeMake(44.0, 44.0)];
    [self.redView addTrailingAndBottomConstraints:CGPointMake(10.0, 10.0) fromBottomLayoutGuideForViewController:self];

    // set green view size and put it in the middle

    [self.greenView addSizeConstraints:CGSizeMake(44.0, 44.0)];
    [self.greenView addCenterConstraints];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];

    // find green view's width constraint and change its constant, making it wider

    NSLayoutConstraint *constraint = [self.greenView constraintsForAttribute:NSLayoutAttributeWidth][0];
    if (constraint)
        constraint.constant = 200.0;

    // find the blue view's leading constraint, remove it, and add trailing constraint (moving it to the upper right)

    if ([self.blueView removeConstraintsForAttribute:NSLayoutAttributeLeading])
        [self.blueView addTrailingConstraint:10.0];

    // find the red view's trailing constraint, remove it, and add leading constraint (moving it to the lower left)

    if ([self.redView removeConstraintsForAttribute:NSLayoutAttributeTrailing])
        [self.redView addLeadingConstraint:10.0];

    // now animate these changes

    [UIView animateWithDuration:1.0 animations:^{
        [self.view layoutIfNeeded];
    }];
}

@end
