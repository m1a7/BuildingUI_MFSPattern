//
//  LoginController+Managment.m
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController+Managment.h"
// Foundation'Category
#import "NSObject+AdditionalProperties.h"
// ViewModel
#import "LoginViewModel.h"
// Own Categories
#import "LoginController+Styles.h"
#import "LoginController+Frames.h"


@interface LoginController (InternalProperties) <InternalPropertiesLoginController>
@end


@implementation LoginController (Managment)

#pragma mark - Lifecycle

////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
/*
  __       __   _______  _______   ______ ____    ____  ______  __       _______
 |  |     |  | |   ____||   ____| /      |\   \  /   / /      ||  |     |   ____|
 |  |     |  | |  |__   |  |__   |  ,----' \   \/   / |  ,----'|  |     |  |__
 |  |     |  | |   __|  |   __|  |  |       \_    _/  |  |     |  |     |   __|
 |  `----.|  | |  |     |  |____ |  `----.    |  |    |  `----.|  `----.|  |____
 |_______||__| |__|     |_______| \______|    |__|     \______||_______||_______|
 */
////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

/*--------------------------------------------------------------------------------------------------------------
 The main method for drawing the interface. Calls the desired sequence of methods
 --------------------------------------------------------------------------------------------------------------*/
- (void) prepareUI
{
    printMethod;
    if (self.view){
        //[self removeSubviews];
        [self initSubviews:self.viewModel];
        [self updateStyles:self.viewModel];
        [self resizeSubviews:self.viewModel];
        [self bindDataFrom:self.viewModel];
        [self addSubviewsToSuperView];
        [self postUIsetting];
    }
}



/*--------------------------------------------------------------------------------------------------------------
  Delete all the 'subviews' and reset all the properties on the UI elements.
 --------------------------------------------------------------------------------------------------------------*/
- (void) removeSubviews
{
    // removing subviews from superview
    for (UIView* subview in self.view.subviews){
        [subview removeFromSuperview];
    }
    // remove sublayers from superlayer
    for (CALayer* sublayer in self.view.layer.sublayers) {
        [sublayer removeFromSuperlayer];
    }

    self.logoImgView   = nil;
    self.signInButton  = nil;
    self.signUpButton  = nil;
    self.gradient      = nil;
}


/*--------------------------------------------------------------------------------------------------------------
 Initializes the desired subviews based on data from the viewModel
 --------------------------------------------------------------------------------------------------------------*/
- (void) initSubviews:(LoginViewModel*)viewModel
{
    printMethod;
    if (self.view)
    {
        if (!self.logoImgView)  self.logoImgView  = [[UIImageView alloc] init];
        if (!self.signInButton) self.signInButton = [UIButton buttonWithType:UIButtonTypeCustom];
        if (!self.signUpButton) self.signUpButton = [UIButton buttonWithType:UIButtonTypeCustom];
    }
}

/*--------------------------------------------------------------------------------------------------------------
 Sets the styles for subviews. Color/font size/button selectors
 --------------------------------------------------------------------------------------------------------------*/
- (void) updateStyles:(LoginViewModel*)viewModel
{
    printMethod;
    if (!viewModel) return;
    
    if (self.logoImgView)  [self styleFor_logoImgView:self.logoImgView   vm:viewModel];
    if (self.signInButton) [self styleFor_signInButton:self.signInButton vm:viewModel];
    if (self.signUpButton) [self styleFor_signUpButton:self.signUpButton vm:viewModel];
}


/*--------------------------------------------------------------------------------------------------------------
 Binds data from the model
 --------------------------------------------------------------------------------------------------------------*/
- (void) bindDataFrom:(LoginViewModel*)viewModel
{
    printMethod;
    // If the models are identical, there is no data binding
    if (([self.oldViewModel isEqualToModel:viewModel]) || (!viewModel)){
        return;
    }
    
    [self.logoImgView setImage:[UIImage imageNamed:viewModel.imageName]];
    [self.signInButton setTitle:viewModel.signInBtnTitle forState:UIControlStateNormal];
    [self.signUpButton setTitle:viewModel.signUpBtnTitle forState:UIControlStateNormal];
    
    self.oldViewModel = viewModel;
}



/*--------------------------------------------------------------------------------------------------------------
 Changing the size of subviews. After changing the orientation or after the first initialization
 --------------------------------------------------------------------------------------------------------------*/
- (void) resizeSubviews:(LoginViewModel*)viewModel
{
    printMethod;
    // Exit if the data model and dimensions are the same
    if ((([self.oldViewModel isEqualToModel:self.viewModel]) && (CGSizeEqualToSize(self.oldSize, self.view.frame.size))) || (!viewModel)) {
        return;
    }
    
    if (self.view){
        if (self.logoImgView)  self.logoImgView.frame  = [LoginController rectFor_logoImgView:viewModel  parentFrame:self.view.frame];
        if (self.signInButton) self.signInButton.frame = [LoginController rectFor_signInButton:viewModel parentFrame:self.view.frame];
        if (self.signUpButton) self.signUpButton.frame = [LoginController rectFor_signUpButton:viewModel parentFrame:self.view.frame];
        if (self.gradient)     self.gradient.frame     =  self.view.bounds;
    
    }
    self.oldSize = self.view.frame.size;
}

/*--------------------------------------------------------------------------------------------------------------
 Adding subviews to parentView
 --------------------------------------------------------------------------------------------------------------*/
- (void) addSubviewsToSuperView
{
    printMethod;
    if (self.view){
        if ((self.logoImgView)  && (!self.logoImgView.superview))   [self.view addSubview:self.logoImgView];
        if ((self.signInButton) && (!self.signInButton.superview))  [self.view addSubview:self.signInButton];
        if ((self.signUpButton) && (!self.signUpButton.superview))  [self.view addSubview:self.signUpButton];
    }
}

@end
