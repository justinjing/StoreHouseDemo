//
//  UIViewAdditions.h
//  StoreHouseDemo
//
//  Created by justinjing on 15/3/1.
//  Copyright (c) 2015年 justinjing. All rights reserved.
//
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView (TTCategory)

/**
 * Shortcut for frame.origin.x.
 *
 * Sets frame.origin.x = left
 */
@property(nonatomic) CGFloat left;

/**
 * Shortcut for frame.origin.y
 *
 * Sets frame.origin.y = top
 */
@property(nonatomic) CGFloat top;

/**
 * Shortcut for frame.origin.x + frame.size.width
 *
 * Sets frame.origin.x = right - frame.size.width
 */
@property(nonatomic) CGFloat right;

/**
 * Shortcut for frame.origin.y + frame.size.height
 *
 * Sets frame.origin.y = bottom - frame.size.height
 */
@property(nonatomic) CGFloat bottom;

/**
 * Shortcut for frame.size.width
 *
 * Sets frame.size.width = width
 */
@property(nonatomic) CGFloat width;

/**
 * Shortcut for frame.size.height
 *
 * Sets frame.size.height = height
 */
@property(nonatomic) CGFloat height;

/**
 * Shortcut for center.x
 *
 * Sets center.x = centerX
 */
@property(nonatomic) CGFloat centerX;

/**
 * Shortcut for center.y
 *
 * Sets center.y = centerY
 */
@property(nonatomic) CGFloat centerY;

/**
 * Return the x coordinate on the screen.
 */
@property(nonatomic,readonly) CGFloat ttScreenX;

/**
 * Return the y coordinate on the screen.
 */
@property(nonatomic,readonly) CGFloat ttScreenY;

#ifdef DEBUG

/**
 * Return the x coordinate on the screen.
 *
 * This method is being rejected by Apple due to false-positive private api static analysis.
 *
 * @deprecated
 */
@property(nonatomic,readonly) CGFloat screenX ;

/**
 * Return the y coordinate on the screen.
 *
 * This method is being rejected by Apple due to false-positive private api static analysis.
 *
 * @deprecated
 */
@property(nonatomic,readonly) CGFloat screenY;

#endif

/**
 * Return the x coordinate on the screen, taking into account scroll views.
 */
@property(nonatomic,readonly) CGFloat screenViewX;

/**
 * Return the y coordinate on the screen, taking into account scroll views.
 */
@property(nonatomic,readonly) CGFloat screenViewY;

/**
 * Return the view frame on the screen, taking into account scroll views.
 */
@property(nonatomic,readonly) CGRect screenFrame;

/**
 * Shortcut for frame.origin
 */
@property(nonatomic) CGPoint origin;

/**
 * Shortcut for frame.size
 */
@property(nonatomic) CGSize size;

/**
 * Return the width in portrait or the height in landscape.
 */
@property(nonatomic,readonly) CGFloat orientationWidth;

/**
 * Return the height in portrait or the width in landscape.
 */
@property(nonatomic,readonly) CGFloat orientationHeight;

/**
 * Finds the first descendant view (including this view) that is a member of a particular class.
 */
- (UIView*)descendantOrSelfWithClass:(Class)cls;

/**
 * Finds the first ancestor view (including this view) that is a member of a particular class.
 */
- (UIView*)ancestorOrSelfWithClass:(Class)cls;

/**
 * Removes all subviews.
 */
- (void)removeAllSubviews;

/**
 * WARNING: This depends on undocumented APIs and may be fragile.  For testing only.
 */
#ifdef DEBUG
- (void)simulateTapAtPoint:(CGPoint)location;
#endif

/**
 * Calculates the offset of this view from another view in screen coordinates.
 *
 * otherView should be a parent view of this view.
 */
- (CGPoint)offsetFromView:(UIView*)otherView;

/**
 * Calculates the frame of this view with parts that intersect with the keyboard subtracted.
 *
 * If the keyboard is not showing, this will simply return the normal frame.
 */
- (CGRect)frameWithKeyboardSubtracted:(CGFloat)plusHeight;

/**
 * Shows the view in a window at the bottom of the screen.
 *
 * This will send a notification pretending that a keyboard is about to appear so that
 * observers who adjust their layout for the keyboard will also adjust for this view.
 */
- (void)presentAsKeyboardInView:(UIView*)containingView;

/**
 * Hides a view that was showing in a window at the bottom of the screen (via presentAsKeyboard).
 *
 * This will send a notification pretending that a keyboard is about to disappear so that
 * observers who adjust their layout for the keyboard will also adjust for this view.
 */
- (void)dismissAsKeyboard:(BOOL)animated;

/**
 * The view controller whose view contains this view.
 */
- (UIViewController*)viewController;
@end
