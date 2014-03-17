//
//  UIView+Layout.m
//
//  Created by Robert Ryan on 11/16/13.
//  Copyright (c) 2013 Robert Ryan. All rights reserved.
//

#import "UIView+AutoLayout.h"

@implementation UIView (AutoLayout)

#pragma mark - Add center alignment constraints

- (void)addCenterXConstraintWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterX
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeCenterX
                                                              multiplier:multiplier
                                                                constant:constant]];
}

- (void)addCenterXConstraint
{
    [self addCenterXConstraintWithMultiplier:1.0 constant:0.0];
}

- (void)addCenterYConstraintWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeCenterY
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeCenterY
                                                              multiplier:multiplier
                                                                constant:constant]];
}

- (void)addCenterYConstraint
{
    [self addCenterYConstraintWithMultiplier:1.0 constant:0.0];
}

- (void)addCenterConstraints
{
    [self addCenterXConstraint];
    [self addCenterYConstraint];
}

#pragma mark - Add position constraints

- (void)addLeadingConstraint:(CGFloat)leading
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeLeading
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeLeading
                                                              multiplier:1.0
                                                                constant:leading]];
}

- (void)addTopConstraint:(CGFloat)top
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTop
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTop
                                                              multiplier:1.0
                                                                constant:top]];
}

- (void)addTopConstraint:(CGFloat)top fromTopLayoutGuideForViewController:(UIViewController *)controller
{
    if (![controller respondsToSelector:@selector(topLayoutGuide)]) {
        [self addTopConstraint:top];
        return;
    }

    id topLayoutGuide = controller.topLayoutGuide;
    NSDictionary *views = NSDictionaryOfVariableBindings(self, topLayoutGuide);
    NSDictionary *metrics = @{@"space" : @(top)};

    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[topLayoutGuide]-(space)-[self]"
                                                                           options:0
                                                                           metrics:metrics
                                                                             views:views]];
}

- (void)addTrailingConstraint:(CGFloat)trailing
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeTrailing
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeTrailing
                                                              multiplier:1.0
                                                                constant:-trailing]];
}

- (void)addBottomConstraint:(CGFloat)bottom
{
    [self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                               attribute:NSLayoutAttributeBottom
                                                               relatedBy:NSLayoutRelationEqual
                                                                  toItem:self.superview
                                                               attribute:NSLayoutAttributeBottom
                                                              multiplier:1.0
                                                                constant:-bottom]];
}

- (void)addBottomConstraint:(CGFloat)bottom fromBottomLayoutGuideForViewController:(UIViewController *)controller
{
    if (![controller respondsToSelector:@selector(bottomLayoutGuide)]) {
        [self addBottomConstraint:bottom];
        return;
    }

    id bottomLayoutGuide = controller.bottomLayoutGuide;
    NSDictionary *views = NSDictionaryOfVariableBindings(self, bottomLayoutGuide);
    NSDictionary *metrics = @{@"space" : @(bottom)};

    [self.superview addConstraints:[NSLayoutConstraint constraintsWithVisualFormat:@"V:[self]-(space)-[bottomLayoutGuide]"
                                                                           options:0
                                                                           metrics:metrics
                                                                             views:views]];
}

- (void)addLeadingAndTopConstraints:(CGPoint)origin
{
    [self addLeadingConstraint:origin.x];
    [self addTopConstraint:origin.y];
}

- (void)addLeadingAndTopConstraints:(CGPoint)origin fromTopLayoutGuideForViewController:(UIViewController *)controller
{
    [self addLeadingConstraint:origin.x];
    [self addTopConstraint:origin.y fromTopLayoutGuideForViewController:controller];
}

- (void)addTrailingAndBottomConstraints:(CGPoint)point
{
    [self addTrailingConstraint:point.x];
    [self addBottomConstraint:point.y];
}

- (void)addTrailingAndBottomConstraints:(CGPoint)point fromBottomLayoutGuideForViewController:(UIViewController *)controller
{
    [self addTrailingConstraint:point.x];
    [self addBottomConstraint:point.y fromBottomLayoutGuideForViewController:controller];
}

#pragma mark - Set size constraints

- (void)addHeightConstraint:(CGFloat)height multiplier:(CGFloat)multiplier
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeHeight
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:multiplier
                                                      constant:height]];
}

- (void)addHeightConstraint:(CGFloat)height
{
    [self addHeightConstraint:height multiplier:1.0];
}

- (void)addWidthConstraint:(CGFloat)width multiplier:(CGFloat)multiplier
{
    [self addConstraint:[NSLayoutConstraint constraintWithItem:self
                                                     attribute:NSLayoutAttributeWidth
                                                     relatedBy:NSLayoutRelationEqual
                                                        toItem:nil
                                                     attribute:NSLayoutAttributeNotAnAttribute
                                                    multiplier:multiplier
                                                      constant:width]];
}

- (void)addWidthConstraint:(CGFloat)width
{
    [self addWidthConstraint:width multiplier:1.0];
}

- (void)addSizeConstraints:(CGSize)size
{
    [self addHeightConstraint:size.height];
    [self addWidthConstraint:size.width];
}

- (void)addSizeConstraints:(CGSize)size multiplier:(CGFloat)multiplier
{
	[self addHeightConstraint:size.height multiplier:multiplier];
	[self addWidthConstraint:size.width multiplier:multiplier];
}

- (void)addRatioSizeConstraint:(CGSize)ratio
{
	[self addConstraint:[NSLayoutConstraint constraintWithItem:self
													 attribute:NSLayoutAttributeHeight
													 relatedBy:NSLayoutRelationEqual
														toItem:self
													 attribute:NSLayoutAttributeWidth
													multiplier:(ratio.height / ratio.width)
													  constant:0.0]];
}

- (void)setHeightConstraint:(CGFloat)height multiplier:(CGFloat)multiplier
{
	[self removeConstraintsForAttribute:NSLayoutAttributeHeight];
	[self addHeightConstraint:height multiplier:multiplier];
}

- (void)setHeightConstraint:(CGFloat)height
{
	[self setHeightConstraint:height multiplier:1.0];
}

- (void)setWidthConstraint:(CGFloat)width multiplier:(CGFloat)multiplier
{
	[self removeConstraintsForAttribute:NSLayoutAttributeWidth];
	[self addWidthConstraint:width multiplier:multiplier];
}

- (void)setWidthConstraint:(CGFloat)width
{
	[self setWidthConstraint:width multiplier:1.0];
}

- (void)setSizeConstraints:(CGSize)size multiplier:(CGFloat)multiplier
{
	[self setHeightConstraint:size.height multiplier:multiplier];
	[self setWidthConstraint:size.width multiplier:multiplier];
}

- (void)setSizeConstraints:(CGSize)size
{
	[self setSizeConstraints:size multiplier:1.0];
}

#pragma mark - Add relation constraints

- (void)addRelationshipConstraintEqualForAttribute:(NSLayoutAttribute)attribute toItem:(id)relatedItem
{
	if (self.superview)
	{
		[self.superview addConstraint:[NSLayoutConstraint constraintWithItem:self
															   attribute:attribute
															   relatedBy:NSLayoutRelationEqual
																  toItem:relatedItem
															   attribute:attribute
															  multiplier:1.0
																constant:0.0]];
	}
}

#pragma mark - Find constraints

- (NSArray *)constraintsForAttribute:(NSLayoutAttribute)attribute
{
    NSMutableArray *constraints = [NSMutableArray array];

    for (NSLayoutConstraint *constraint in self.constraints)
    {
        if (constraint.firstAttribute == attribute)
        {
            [constraints addObject:constraint];
        }
    }

    if ([constraints count] == 0)
        return nil;

    return constraints;
}

- (NSArray *)constraintsWithinSuperviewForAttribute:(NSLayoutAttribute)attribute
{
    NSMutableArray *constraints = [NSMutableArray array];

    for (NSLayoutConstraint *constraint in self.superview.constraints)
    {
        if ((constraint.firstAttribute  == attribute && constraint.firstItem  == self) ||
            (constraint.secondAttribute == attribute && constraint.secondItem == self))
        {
            [constraints addObject:constraint];
        }
    }

    if ([constraints count] == 0)
        return nil;

    return constraints;
}

#pragma mark - Remove constraints

- (BOOL) removeConstraintsForAttribute:(NSLayoutAttribute)attribute
{
    BOOL success = NO;

    if (attribute == NSLayoutAttributeHeight || attribute == NSLayoutAttributeWidth)
    {
        NSArray *constraints = [self constraintsForAttribute:attribute];

        if (constraints)
        {
            [self removeConstraints:constraints];
            success = YES;
        }
    }
    else
    {
        NSArray *constraints = [self constraintsWithinSuperviewForAttribute:attribute];

        if (constraints)
        {
            [self.superview removeConstraints:constraints];
            success = YES;
        }
    }

    return success;
}

- (BOOL)removeConstraintsAffectingAttribute:(NSLayoutAttribute)attribute
{
	BOOL success = [self removeConstraintsForAttribute:attribute];
	
	if (attribute == NSLayoutAttributeHeight || attribute == NSLayoutAttributeWidth)
	{
		NSArray *constraints = [self constraintsWithinSuperviewForAttribute:attribute];
		if (constraints)
		{
			[self.superview removeConstraints:constraints];
			success = YES;
		}
	}
	
	return success;
}

@end
