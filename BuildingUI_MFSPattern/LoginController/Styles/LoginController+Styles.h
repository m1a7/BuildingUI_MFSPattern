//
//  LoginController+Styles.h
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController.h"

NS_ASSUME_NONNULL_BEGIN

@interface LoginController (Styles)

- (void) styleFor_logoImgView:(UIImageView*)imgView vm:(LoginViewModel*)viewModel;
- (void) styleFor_signInButton:(UIButton*)button vm:(LoginViewModel*)viewModel;
- (void) styleFor_signUpButton:(UIButton*)button vm:(LoginViewModel*)viewModel;

- (void) postUIsetting;

@end

NS_ASSUME_NONNULL_END
