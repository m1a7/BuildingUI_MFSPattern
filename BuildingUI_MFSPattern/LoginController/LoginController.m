//
//  LoginController.m
//  BuildingUI_MFSPattern
//
//  Created by Uber on 12/01/2021.
//  Copyright © 2021 Mobile. All rights reserved.
//

#import "LoginController.h"
// ViewModel
#import "LoginViewModel.h"
// Own Categories
#import "LoginController+Managment.h"
#import "LoginController+Styles.h"
#import "LoginController+Frames.h"
// Foundation'Category
#import "NSObject+AdditionalProperties.h"



@interface LoginController ()

@property (nonatomic, strong) LoginViewModel* oldViewModel;
@property (nonatomic, assign) CGSize oldSize;

@end

@implementation LoginController


#pragma mark - Life cycle
/*--------------------------------------------------------------------------------------------------------------
 Called after the controller's view is loaded into memory.
 --------------------------------------------------------------------------------------------------------------*/
- (void)viewDidLoad {
    [super viewDidLoad];
}

/*--------------------------------------------------------------------------------------------------------------
 Inside the method, an internal method is called that configures all UI elements
 --------------------------------------------------------------------------------------------------------------*/
- (void) viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    [self prepareUI];
}


/*--------------------------------------------------------------------------------------------------------------
 Called when the device is flipped over
 --------------------------------------------------------------------------------------------------------------*/
- (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(id<UIViewControllerTransitionCoordinator>)coordinator {

    __weak LoginController* weak = self;
    [coordinator animateAlongsideTransition:nil completion:^(id<UIViewControllerTransitionCoordinatorContext> context) {
        [UIView animateWithDuration:0.3 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
            [weak resizeSubviews:weak.viewModel];
        } completion:nil];
    }];
}


#pragma mark - Action

- (void) signUpBtnAction:(UIButton*)sender
{
    [self.viewModel signUpBtnAction];
}


- (void) signInBtnAction:(UIButton*)sender
{
    [self.viewModel signInBtnAction];
}


#pragma mark - Getters/Setters

- (void)setViewModel:(LoginViewModel *)viewModel
{
    _viewModel = viewModel;
    if ((!self.oldViewModel) && (self.view)){
         [self prepareUI];
    } else if ((self.oldViewModel) && (self.view)){
        [self bindDataFrom:viewModel];
        [self resizeSubviews:viewModel];
    }
}

#pragma mark - Initialization
/*--------------------------------------------------------------------------------------------------------------
  Initializes the controller using the ViewModel
 --------------------------------------------------------------------------------------------------------------*/
+ (LoginController*) initWithViewModel:(nullable LoginViewModel*)viewModel
{
    LoginController* vc = [[LoginController alloc] init];
    if (vc) {
        vc.viewModel = (viewModel) ? viewModel : [LoginViewModel defaultMockup];
    }
    return vc;
}

@end
