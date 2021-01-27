//
//  LoginController+Frames.m
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController+Frames.h"
// ViewModel
#import "LoginViewModel.h"

/*--------------------------------------------------------------------------------------------------------------
 Structure of cache:
 @{
 |   320  : @{
 | (ширина)  | "titleLbl" : nsValue(cgRect:0,0,300x50),
 | (экрана)  | "mainLbl"  : nsValue(cgRect:0,0,300x50)
 |           },
 }
 --------------------------------------------------------------------------------------------------------------*/
static NSMutableDictionary<NSNumber*,NSMutableDictionary*>* _subviewsStaticRects = nil;


@implementation LoginController (Frames)


/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, nullable) UIImageView* logoImgView;
 --------------------------------------------------------------------------------------------------------------*/
+ (CGRect) rectFor_logoImgView:(LoginViewModel*)viewModel parentFrame:(CGRect)parentFrame
{
    if (CGRectEqualToRect(CGRectZero, parentFrame)) return CGRectZero;

    CGSize parentSize = parentFrame.size;
    
    // Extract from cache (if cached it already)
    if (LoginController.subviewsStaticRects[@(parentSize.width)][@"logoImgView"]){
        return [LoginController.subviewsStaticRects[@(parentSize.width)][@"logoImgView"] CGRectValue];
    }
    // Calculating
    float offset = 15;
    float onePercent = parentSize.width/100.f;
    float width,height,x,y; width=height=x=y=0;

    UIDeviceOrientation orientation = UIDeviceOrientationUnknown;
    orientation = (parentSize.width >= parentSize.height) ? UIDeviceOrientationLandscapeLeft : UIDeviceOrientationPortrait;
    
    if (orientation == UIDeviceOrientationPortrait){
         width  = onePercent*80;
         height = width*0.5;
         x = CGRectGetMidX(parentFrame) - (width/2);
         y = CGRectGetMinY(parentFrame) + (height/3);
    } else if (orientation == UIDeviceOrientationLandscapeLeft){
        width  = onePercent*60;
        height = width*0.5;
        x = CGRectGetMidX(parentFrame) - (width/2);
        y = CGRectGetMinY(parentFrame) + offset*2;
    }
        
    CGPoint point = CGPointMake(x, y);
    CGSize  size  = CGSizeMake(width, height);
    CGRect  rect  = CGRectMake(point.x, point.y, size.width, size.height);
    rect  = CGRectIntegral(rect);
    
    // Create nasted dictionary if it doesn't exit
    if (!LoginController.subviewsStaticRects[@(parentSize.width)]){
         LoginController.subviewsStaticRects[@(parentSize.width)] = @{}.mutableCopy;
    }
    // Save in the cache
    NSMutableDictionary* nastedDict = LoginController.subviewsStaticRects[@(parentSize.width)];
    nastedDict[@"logoImgView"] = [NSValue valueWithCGRect:rect];
    return rect;
}


/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, nullable) UIButton* signInButton;
 --------------------------------------------------------------------------------------------------------------*/
+ (CGRect) rectFor_signInButton:(LoginViewModel*)viewModel parentFrame:(CGRect)parentFrame
{
    if (CGRectEqualToRect(CGRectZero, parentFrame)) return CGRectZero;
   
    CGSize parentSize = parentFrame.size;
    
    // Extract from cache (if cached it already)
    if (LoginController.subviewsStaticRects[@(parentSize.width)][@"signInButton"]){
        return [LoginController.subviewsStaticRects[@(parentSize.width)][@"signInButton"] CGRectValue];
    }
    // Calculating
    float offset = 15;
    float onePercentWidth  = parentSize.width/100.f;
    float width,height,x,y;  width=height=x=y=0;

    UIDeviceOrientation orientation = UIDeviceOrientationUnknown;
    orientation = (parentSize.width >= parentSize.height) ? UIDeviceOrientationLandscapeLeft : UIDeviceOrientationPortrait;

    
    if (orientation == UIDeviceOrientationPortrait){
        width  = onePercentWidth*90;
        height = 35;
        x = CGRectGetMidX(parentFrame) - (width/2);
        CGRect signUpBtnRect = [LoginController rectFor_signUpButton:viewModel parentFrame:parentFrame];
        y = CGRectGetMinY(signUpBtnRect)-offset-height;
    } else if (orientation == UIDeviceOrientationLandscapeLeft){
        width = (CGRectGetWidth(parentFrame)/2) - (offset*2);
        height = 35;
        x = CGRectGetMidX(parentFrame)-offset-width;
        y = CGRectGetMaxY(parentFrame)-height-offset;
    }
    
    CGPoint point = CGPointMake(x, y);
    CGSize  size  = CGSizeMake(width, height);
    CGRect  rect  = CGRectMake(point.x, point.y, size.width, size.height);
    rect  = CGRectIntegral(rect);
    
    // Create nasted dictionary if it doesn't exit
    if (!LoginController.subviewsStaticRects[@(parentSize.width)]){
         LoginController.subviewsStaticRects[@(parentSize.width)] = @{}.mutableCopy;
    }
    // Save in the cache
    NSMutableDictionary* nastedDict = LoginController.subviewsStaticRects[@(parentSize.width)];
    nastedDict[@"signInButton"] = [NSValue valueWithCGRect:rect];
    return rect;
}

/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, nullable) UIButton* signUpButton;
 --------------------------------------------------------------------------------------------------------------*/
+ (CGRect) rectFor_signUpButton:(LoginViewModel*)viewModel parentFrame:(CGRect)parentFrame
{
    if (CGRectEqualToRect(CGRectZero, parentFrame)) return CGRectZero;
    
    CGSize parentSize = parentFrame.size;
    
    // Extract from cache (if cached it already)
    if (LoginController.subviewsStaticRects[@(parentSize.width)][@"signUpButton"]){
        return [LoginController.subviewsStaticRects[@(parentSize.width)][@"signUpButton"] CGRectValue];
    }
    // Calculating
    float offset = 15;
    float onePercentWidth  = parentSize.width/100.f;
    float onePercentHeight = parentSize.height/100.f;
    float width,height,x,y;  width=height=x=y=0;
    
    UIDeviceOrientation orientation = UIDeviceOrientationUnknown;
    orientation = (parentSize.width >= parentSize.height) ? UIDeviceOrientationLandscapeLeft : UIDeviceOrientationPortrait;
    
    if (orientation == UIDeviceOrientationPortrait){
        width  = onePercentWidth*90;
        height = 35;
        x = CGRectGetMidX(parentFrame) - (width/2);
        y = CGRectGetMaxY(parentFrame) - (onePercentHeight*10);
    } else if (orientation == UIDeviceOrientationLandscapeLeft){
        width = (CGRectGetWidth(parentFrame)/2) - (offset*2);
        height = 35;
        x = CGRectGetMidX(parentFrame)+offset;
        y = CGRectGetMaxY(parentFrame)-height-offset;
    }
    
    CGPoint point = CGPointMake(x, y);
    CGSize  size  = CGSizeMake(width, height);
    CGRect  rect  = CGRectMake(point.x, point.y, size.width, size.height);
    rect  = CGRectIntegral(rect);
    
    // Create nasted dictionary if it doesn't exit
    if (!LoginController.subviewsStaticRects[@(parentSize.width)]){
         LoginController.subviewsStaticRects[@(parentSize.width)] = @{}.mutableCopy;
    }
    // Save in the cache
    NSMutableDictionary* nastedDict = LoginController.subviewsStaticRects[@(parentSize.width)];
    nastedDict[@"signUpButton"] = [NSValue valueWithCGRect:rect];
    return rect;
}



////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
   _______  _______ .___________.___________. _______ .______          _______.
  /  _____||   ____||           |           ||   ____||   _  \        /       |
 |  |  __  |  |__   `---|  |----`---|  |----`|  |__   |  |_)  |      |   (----`
 |  | |_ | |   __|      |  |        |  |     |   __|  |      /        \   \
 |  |__| | |  |____     |  |        |  |     |  |____ |  |\  \----.----)   |
  \______| |_______|    |__|        |__|     |_______|| _| `._____|_______/
 */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

#pragma mark - Getters/Setters

/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, class) NSMutableDictionary<NSNumber*,NSMutableDictionary*>* subviewsStaticRects;
 --------------------------------------------------------------------------------------------------------------*/
+ (NSMutableDictionary<NSNumber *,NSMutableDictionary *> *)subviewsStaticRects
{
    if (!_subviewsStaticRects){
         _subviewsStaticRects = [NSMutableDictionary new];
    }
    return _subviewsStaticRects;
}

+ (void)setSubviewsStaticRects:(NSMutableDictionary<NSNumber *,NSMutableDictionary *> *)subviewsStaticRects
{
    _subviewsStaticRects = subviewsStaticRects;
}



@end
