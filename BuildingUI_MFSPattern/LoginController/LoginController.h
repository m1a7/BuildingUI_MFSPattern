//
//  LoginController.h
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import <UIKit/UIKit.h>
// ViewModel
@class LoginViewModel;


NS_ASSUME_NONNULL_BEGIN

@interface LoginController : UIViewController

// ViewModel
@property (nonatomic, strong, nullable) LoginViewModel* viewModel;
// UI
@property (nonatomic, strong, nullable) UIImageView* logoImgView;
@property (nonatomic, strong, nullable) UIButton* signInButton;
@property (nonatomic, strong, nullable) UIButton* signUpButton;

@property (nonatomic, strong, nullable) CAGradientLayer *gradient;

#pragma mark - Actions

- (void) signUpBtnAction:(UIButton*)sender;
- (void) signInBtnAction:(UIButton*)sender;


#pragma mark - Initialization
/*--------------------------------------------------------------------------------------------------------------
  Initializes the controller using the ViewModel
 --------------------------------------------------------------------------------------------------------------*/
+ (LoginController*) initWithViewModel:(nullable LoginViewModel*)viewModel;

@end


/*--------------------------------------------------------------------------------------------------------------
  Protocol for internal using.
 --------------------------------------------------------------------------------------------------------------*/
@protocol InternalPropertiesLoginController <NSObject>

@property (nonatomic, strong) LoginViewModel* oldViewModel;
@property (nonatomic, assign) CGSize oldSize;

@end



NS_ASSUME_NONNULL_END

