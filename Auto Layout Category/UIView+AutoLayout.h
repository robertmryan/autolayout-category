//
//  UIView+Layout.h
//
//  Created by Robert Ryan on 11/16/13.
//  Copyright (c) 2013 Robert Ryan. All rights reserved.
//

#import <UIKit/UIKit.h>

/** Category of auto layout convenience methods.
 
 ##Usage
 
 1. Add `UIView+AutoLayout.h` and `UIView+AutoLayout.m` to your project.
 
 2. Import header file:
 
        #import "UIView+AutoLayout.h"
 
 3. You can now use the appropriate `UIView` methods this category provides to easily add the necessary constraints, e.g.
 
        @implementation ViewController

        - (void)viewDidLoad
        {
            [super viewDidLoad];

            // create three random views

            UIView *blueView = [[UIView alloc] init];
            blueView.translatesAutoresizingMaskIntoConstraints = NO;
            blueView.backgroundColor = [UIColor blueColor];
            [self.view addSubview:blueView];

            UIView *redView = [[UIView alloc] init];
            redView.translatesAutoresizingMaskIntoConstraints = NO;
            redView.backgroundColor = [UIColor redColor];
            [self.view addSubview:redView];

            UIView *greenView = [[UIView alloc] init];
            greenView.translatesAutoresizingMaskIntoConstraints = NO;
            greenView.backgroundColor = [UIColor greenColor];
            [self.view addSubview:greenView];

            // set blue view size and put it in upper left corner

            [blueView addSizeConstraints:CGSizeMake(44.0, 44.0)];
            [blueView addLeadingAndTopConstraints:CGPointMake(10.0, 10.0) fromTopLayoutGuideForViewController:self];

            // set red view size and put it in lower right corner

            [redView addSizeConstraints:CGSizeMake(44.0, 44.0)];
            [redView addTrailingAndBottomConstraints:CGPointMake(10.0, 10.0) fromBottomLayoutGuideForViewController:self];

            // set green view size and put it in the middle

            [greenView addSizeConstraints:CGSizeMake(44.0, 44.0)];
            [greenView addCenterConstraints];
        }

        @end

 */

@interface UIView (AutoLayout)


/// --------------------------------------
/// @name Add center alignment constraints
/// --------------------------------------

/** Add constraint to center view horizontally with respect to its superview
 *
 * @param multiplier Multiplier to apply when aligning horizontally.
 *                   A value of 1.0 will center it.
 *                   A value less than 1.0 will shift it left.
 *                   A value greater than 1.0 will shift it right.
 * @param constant   Constant to apply when aligning horizontally, measured in points.
 *                   A positive value will shift it right.
 *                   A negative value will shift it left.
 *
 * @note If you simply want to center the view horizontally, you can use `addCenterXConstraint:`.
 *
 * @see addCenterXConstraint
 */

- (void)addCenterXConstraintWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/** Add constraint to center view horizontally with respect to its superview.
 *
 * If you want to control the `multiplier` and `constant` values for the constraint, see `addCenterXConstraintWithMultiplier:constant:`.
 *
 * @see addCenterXConstraintWithMultiplier:constant:
 */

- (void)addCenterXConstraint;

/** Add constraint to center view vertically with respect to its superview
 *
 * If you simply want to center the view vertically, you can use `addCenterYConstraint`.
 *
 * @param multiplier Multiplier to apply when aligning vertically.
 *                   A value of 1.0 will center it.
 *                   A value less than 1.0 will shift it up.
 *                   A value greater than 1.0 will shift it down.
 * @param constant   Constant to apply when aligning horizontally, measured in points.
 *                   A positive value will shift it down.
 *                   A negative value will shift it up.
 *
 * @see addCenterYConstraint
 */

- (void)addCenterYConstraintWithMultiplier:(CGFloat)multiplier constant:(CGFloat)constant;

/** Add constraint to center view vertically with respect to its superview.
 *
 * If you want to control the `multiplier` and `constant` values for the constraint, see `addCenterYConstraintWithMultiplier:constant:`.
 *
 * @see addCenterYConstraintWithMultiplier:constant:
 */

- (void)addCenterYConstraint;

/** Add constraints to center view both horizontally and vertically with respect to its superview. 
 *
 * @see addCenterXConstraint
 * @see addCenterYConstraint
 */

- (void)addCenterConstraints;


/// ------------------------------
/// @name Add position constraints
/// ------------------------------

/** Add leading (generally left) constraint for view.
 *
 * @param leading Leading constraint in points.
 */

- (void)addLeadingConstraint:(CGFloat)leading;

/** Add top constraint for view.
 *
 * If you want to offset this from the view controller's top layout guide in iOS 7+, see `addTopConstraint:fromTopLayoutGuideForViewController:`.
 *
 * @param top Top constraint in points.
 *
 * @see addTopConstraint:fromTopLayoutGuideForViewController:
 */

- (void)addTopConstraint:(CGFloat)top;

/** Add top constraint for view from the view controller's top layout guide.
 *
 * If you do not want to offset this from the view controller's top layout guide in iOS 7, see `addTopConstraint:`.
 *
 * @param top          Top constraint in points.
 * @param controller   View controller with top layout guide.
 *
 * @note If not using iOS7+, this will just call `addTopContraint:`.
 *
 * @see addTopConstraint:
 * @see addBottomConstraint:fromBottomLayoutGuideForViewController:
 */

- (void)addTopConstraint:(CGFloat)top fromTopLayoutGuideForViewController:(UIViewController *)controller;

/** Add trailing (generally right) constraint for view.
 *
 * @param trailing Trailing constraint in points.
 */

- (void)addTrailingConstraint:(CGFloat)trailing;

/** Add constraint from the bottom of the view to the bottom of its superview's bottom.
 *
 * To add a constraint from the iOS7+ bottom layout guide, see `addBottomConstraint:fromBottomLayoutGuideForViewController:`.
 *
 * @param bottom Bottom constraint in points. Use positive `bottom` value to offset this view inside its superview, negative values to offset this view beyond its superview.
 *
 * @note Use positive `bottom` value to offset this view inside its superview, negative values to offset this view beyond its superview.
 *
 * @see addBottomConstraint:fromBottomLayoutGuideForViewController:
 */

- (void)addBottomConstraint:(CGFloat)bottom;

/** Add constraint from the bottom of the view to the view controller's bottom layout guide.
 *
 * If you do not want to add a constraint from the iOS7+ bottom layout guide, see `addBottomConstraint:`.
 *
 * @param bottom       Bottom constraint in points. Use positive `bottom` value to offset this view inside its superview, negative values to offset this view beyond its superview.
 * @param controller   View controller with bottom layout guide.
 *
 * @note If not using iOS7+, this will just call `addBottomContraint:`.
 *
 * @see addBottomConstraint:
 * @see addTopConstraint:fromTopLayoutGuideForViewController:
 */

- (void)addBottomConstraint:(CGFloat)bottom fromBottomLayoutGuideForViewController:(UIViewController *)controller;

/** Add leading (generally left) and top constraints for view.
 *
 * @param origin CGPoint of origin of view.
 *
 * @see addLeadingConstraint:
 * @see addTopConstraint:
 */

- (void)addLeadingAndTopConstraints:(CGPoint)origin;

/** Add leading (generally left) and top constraints for view from the view controller's top layout guide.
 *
 * @param origin       CGPoint of origin of view.
 * @param controller   View controller with top layout guide.
 *
 * @see addLeadingConstraint:
 * @see addTopConstraint:fromTopLayoutGuideForViewController:
 */

- (void)addLeadingAndTopConstraints:(CGPoint)origin fromTopLayoutGuideForViewController:(UIViewController *)controller;

/** Add trailing (generally right) and bottom constraints for view.
 *
 * @param point CGPoint of lower right corner of view (with respect to lower right corner of its superview).
 *
 * @see addTrailingConstraint:
 * @see addBottomConstraint:
 */

- (void)addTrailingAndBottomConstraints:(CGPoint)point;

/** Add trailing (generally right) and bottom constraints for view from the view controller's bottom layout guide.
 *
 * @param point        CGPoint of lower right corner of view (with respect to lower right corner of its superview).
 * @param controller   View controller with bottom layout guide.
 *
 * @see addTrailingConstraint:
 * @see addBottomConstraint:fromBottomLayoutGuideForViewController:
 */

- (void)addTrailingAndBottomConstraints:(CGPoint)point fromBottomLayoutGuideForViewController:(UIViewController *)controller;

/// --------------------------
/// @name Add size constraints
/// --------------------------

/** Set height of view using constraints.
 *
 * @param height Height of view in points.
 *
 * @see addWidthConstraint:
 * @see addSizeConstraints:
 */

- (void)addHeightConstraint:(CGFloat)height;

/** Set width of view using constraints.
 *
 * @param width Width of view in points.
 *
 * @see addHeightConstraint:
 * @see addSizeConstraints:
 */

- (void)addWidthConstraint:(CGFloat)width;

/** Set size (both height and width) of view using constraints.
 *
 * @param size The `CGSize` of view in points.
 *
 * @see addHeightConstraint:
 * @see addWidthConstraint:
 */

- (void)addSizeConstraints:(CGSize)size;

/** Replace existing height constraints with a new constraint.
 *
 *  @param height Height of view in points.
 *
 *	@see addHeightConstraint:
 *	@see removeConstraintsForAttribute:
 *	@see setSizeConstraintsToSize:
 */
- (void)setHeightConstraint:(CGFloat)height;

/** Replace existing width constraints with a new constraint.
 *
 *  @param width Width of view in points.
 *
 *	@see addWidthConstraint:
 *	@see removeConstraintsForAttribute:
 *	@see setSizeConstraintsToSize:
 */
- (void)setWidthConstraint:(CGFloat)width;

/** Replace existing (both height and width) constraints with new constraints.
 *
 *  @param size The `CGSize` of view in points.
 *
 *	@see addHeightConstraint:
 *	@see addWidthConstraint:
 *	@see removeConstraintsForAttribute:
 */
- (void)setSizeConstraintsToSize:(CGSize)size;

/// ----------------------
/// @name Find constraints
/// ----------------------

/** Find constraints within the view's list of constraints for the given attribute.
 *
 * If the constraint being searched for is not related to any other item (notably size and width), then this method can be used to find it. If you are looking for an attribute associated with the `superview`, use `constraintsWithinSuperviewForAttribute:`, instead.
 *
 * @param attribute  The `NSLayoutAttribute` being searched for.
 *
 * @return           Returns an array of `NSLayoutAttribute` objects (often only one). If no constraints, this returns `nil`.
 */

- (NSArray *)constraintsForAttribute:(NSLayoutAttribute)attribute;

/** Find constraints within the superview's list of constraints for this view and for the given attribute.
 *
 * If the constraint being searched for is not related to any other item (notably size and width), then you should use `constraintsForAttribute:`. This method searches the `superview`'s constraints for one for this with with the desired attribute, which is generally useful for any constraints other than size and width constraints.
 *
 * @param attribute  The `NSLayoutAttribute` being searched for.
 *
 * @return           Returns an array of `NSLayoutAttribute` objects (often only one). If no constraints, this returns `nil`.
 */

- (NSArray *)constraintsWithinSuperviewForAttribute:(NSLayoutAttribute)attribute;

/// ------------------------
/// @name Remove constraints
/// ------------------------

/** Remove constraints for particular attribute of this view.
 *
 * If the constraint with a width or size attribute, it will search the view's list of constraints. If it's any other type of attribute, it will search the superview's list of constraints for it.
 *
 * @param attribute  The `NSLayoutAttribute` to be found and removed.
 *
 * @return           Returns `YES` if constraint(s) found and removed. Returns `NO` if not.
 */

- (BOOL) removeConstraintsForAttribute:(NSLayoutAttribute)attribute;

@end
