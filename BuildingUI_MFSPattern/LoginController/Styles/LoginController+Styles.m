//
//  LoginController+Styles.m
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController+Styles.h"
// ViewModel
#import "LoginViewModel.h"
// UIKit categories
#import "UIView+AdditionalProperties.h"

@implementation LoginController (Styles)

/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, nullable) UIImageView* logoImgView;
 --------------------------------------------------------------------------------------------------------------*/
- (void) styleFor_logoImgView:(UIImageView*)imgView vm:(LoginViewModel*)viewModel
{
    if (!imgView.isStylized){
        imgView.contentMode = UIViewContentModeScaleAspectFit;
        imgView.backgroundColor = [UIColor clearColor];
        imgView.opaque = YES;
        imgView.clipsToBounds       = YES;
        imgView.layer.masksToBounds = YES;
        imgView.alpha = 1.0f;
        imgView.isStylized = YES;
    }
}

/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, nullable) UIButton* signInButton;
 --------------------------------------------------------------------------------------------------------------*/
- (void) styleFor_signInButton:(UIButton*)button vm:(LoginViewModel*)viewModel
{
    if (!button.isStylized){
        UIColor* purpleColor = [UIColor colorWithRed: 0.62 green: 0.13 blue: 0.92 alpha: 1.00];;
        [button setTintColor:[UIColor whiteColor]];
        [button.titleLabel setOpaque:YES];
        [button.titleLabel setBackgroundColor:purpleColor];
        [button setBackgroundColor:purpleColor];
        [button addTarget:self action:@selector(signInBtnAction:) forControlEvents:UIControlEventTouchUpInside];

        button.layer.shadowColor   = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25f] CGColor];
        button.layer.shadowOffset  = CGSizeMake(0, 2.0f);
        button.layer.shadowOpacity = 1.0f;
        button.layer.shadowRadius  = 0.0f;
        button.layer.masksToBounds = NO;
        button.layer.cornerRadius  = 4.0f;
        button.isStylized = YES;
    }
}

/*--------------------------------------------------------------------------------------------------------------
 @property (nonatomic, strong, nullable) UIButton* signUpButton;
 --------------------------------------------------------------------------------------------------------------*/
- (void) styleFor_signUpButton:(UIButton*)button vm:(LoginViewModel*)viewModel
{
    if (!button.isStylized){
        UIColor* greenColor = [UIColor colorWithRed: 0.06 green: 0.73 blue: 0.69 alpha: 1.00];
        [button setTintColor:[UIColor whiteColor]];
        [button.titleLabel setOpaque:YES];
        [button.titleLabel setBackgroundColor:greenColor];
        [button setBackgroundColor:greenColor];
        [button addTarget:self action:@selector(signUpBtnAction:) forControlEvents:UIControlEventTouchUpInside];
        
        button.layer.shadowColor   = [[UIColor colorWithRed:0 green:0 blue:0 alpha:0.25f] CGColor];
        button.layer.shadowOffset  = CGSizeMake(0, 2.0f);
        button.layer.shadowOpacity = 1.0f;
        button.layer.shadowRadius  = 0.0f;
        button.layer.masksToBounds = NO;
        button.layer.cornerRadius  = 4.0f;
        button.isStylized = YES;
    }
}

/*--------------------------------------------------------------------------------------------------------------
 In the 'postUIsetting', we configure UI components for which we have not created individual methods
 --------------------------------------------------------------------------------------------------------------*/
- (void) postUIsetting
{
    UIColor* firstColor  = [UIColor colorWithRed: 0.54 green: 0.36 blue: 0.79 alpha: 1.00];
    UIColor* secondColor = [UIColor colorWithRed: 0.41 green: 0.59 blue: 0.88 alpha: 1.00];;
    
    self.gradient = [CAGradientLayer layer];
    self.gradient.frame      = self.view.bounds;
    self.gradient.startPoint = CGPointZero;
    self.gradient.endPoint   = CGPointMake(1, 1);
    self.gradient.colors     = [NSArray arrayWithObjects:(id)firstColor.CGColor,(id)secondColor.CGColor, nil];
    [self.view.layer insertSublayer:self.gradient atIndex:0];
}


@end
