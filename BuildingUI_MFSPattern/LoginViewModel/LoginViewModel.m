//
//  LoginViewModel.m
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginViewModel.h"

@implementation LoginViewModel


#pragma mark - Actions

- (void) signUpBtnAction
{
    NSLog(@"signUpBtnAction");
}

- (void) signInBtnAction
{
    NSLog(@"signInBtnAction");
}

#pragma mark - Initialization

+ (LoginViewModel*) defaultMockup
{
    LoginViewModel* viewModel = [[LoginViewModel alloc] init];
    if (viewModel) {
        viewModel.imageName      = @"logo";
        viewModel.signInBtnTitle = @"SignIn";
        viewModel.signUpBtnTitle = @"SignUp";
    }
    return viewModel;
}


/*--------------------------------------------------------------------------------------------------------------
 Compares data models for identity.
 --------------------------------------------------------------------------------------------------------------*/
- (BOOL) isEqualToModel:(LoginViewModel*)object
{
    BOOL isEqual = YES;
    if (![object.imageName isEqualToString:self.imageName]){
        return NO;
    }
    if (![object.signInBtnTitle isEqualToString:self.signInBtnTitle]){
        return NO;
    }
    if (![object.signUpBtnTitle isEqualToString:self.signUpBtnTitle]){
        return NO;
    }
    return isEqual;
}


@end
