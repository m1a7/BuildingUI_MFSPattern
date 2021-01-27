//
//  LoginController+Frames.h
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginController (Frames)

/*--------------------------------------------------------------------------------------------------------------
 Structure of cache:
 @{
 |   320  : @{
 | (ширина)  | "titleLbl" : nsValue(cgRect:0,0,300x50),
 | (экрана)  | "mainLbl"  : nsValue(cgRect:0,0,300x50)
 |           },
 }
 --------------------------------------------------------------------------------------------------------------*/
@property (nonatomic, strong, class) NSMutableDictionary<NSNumber*,NSMutableDictionary*>* subviewsStaticRects;


+ (CGRect) rectFor_logoImgView:(LoginViewModel*)viewModel parentFrame:(CGRect)parentFrame;
+ (CGRect) rectFor_signInButton:(LoginViewModel*)viewModel parentFrame:(CGRect)parentFrame;
+ (CGRect) rectFor_signUpButton:(LoginViewModel*)viewModel parentFrame:(CGRect)parentFrame;

@end

NS_ASSUME_NONNULL_END
